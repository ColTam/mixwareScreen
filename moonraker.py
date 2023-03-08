import json
import logging
import re
import threading
import requests

from websocket import WebSocketApp


class Moonraker(object):
    def __init__(self, printer):
        self._printer = printer

        self._websocket = None
        self._req_id = 0
        self.status = ''
        # websocket.enableTrace(True)
        self.host = "192.168.0.78"
        self.port = "7125"

    def send_method(self, method, params=None, callback=None, *args):
        # if not self.connected:
        #     return False
        if params is None:
            params = {}

        self._req_id += 1
        # if callback is not None:
        #     self.callback_table[self._req_id] = [callback, method, params, [*args]]

        data = {
            "jsonrpc": "2.0",
            "method": method,
            "params": params,
            "id": self._req_id
        }
        self._websocket.send(json.dumps(data))
        return True
    def connect(self):
        oneshot_token = self.get_oneshot_token()
        logging.debug(f"debug to {oneshot_token}")
        websocket_url = f"{self.get_ws_protocol}://{self.get_url}/websocket?token={oneshot_token}"
        logging.debug(f"debug to {websocket_url}")
        self._websocket = WebSocketApp(websocket_url,
                          on_open=self.on_open, on_message=self.on_message, on_error=self.on_error,
                          on_close=self.on_close)
        # _websocket.run_forever()
        _websocket_thread = threading.Thread(target=self._websocket.run_forever, daemon=True)
        try:
            logging.debug("Starting websocket thread")
            _websocket_thread.start()
        except Exception as e:
            logging.critical(e, exc_info=True)
            logging.debug("Error starting web socket")
    def on_open(self, *args):
        logging.info("Moonraker Websocket Open")
        # self.connected = True
        # self._screen.reinit_count = 0
        # self.reconnect_count = 0
        # if "on_connect" in self._callback:
            # GLib.idle_add(self._callback['on_connect'])
    def on_message(self, *args):
        message = args[1] if len(args) == 2 else args[0]
        response = json.loads(message)
        if "id" in response:
            if "heater_bed" in response['result']:
                self._printer.temp = response['result']
            elif "path" in response['result'][0]:
                self._printer.filelist = response['result']
                self._printer.print_start(self._printer.filelist[3]['path'])
            return
            # elif 'status' in response['result']:
            #     self._printer.state = response['result']['state']['webhooks']['state']
        # if "method" in response:
            # print(response.keys())
        # if "id" in response and response['id'] in self.callback_table:
        #     args = (response,
        #             self.callback_table[response['id']][1],
        #             self.callback_table[response['id']][2],
        #             *self.callback_table[response['id']][3])
        #     GLib.idle_add(self.callback_table[response['id']][0], *args)
        #     self.callback_table.pop(response['id'])
        #     return


        if "method" in response:
            if response['method'] == 'notify_klippy_ready':
                self._printer.update_state.emit('notify_klippy_ready')
            elif response['method'] == 'notify_klippy_disconnected':
                self._printer.update_state.emit('notify_klippy_disconnected')
        # if "method" in response and "on_message" in self._callback:
        #     args = response['method'], response['params'][0] if "params" in response else {}
        #     GLib.idle_add(self._callback['on_message'], *args)
        return
    def on_close(self, *args):
        # args: ws, status, message
        # sometimes ws is not passed due to bugs
        message = args[2] if len(args) == 3 else args[1]
        if message is not None:
            logging.info(f"{message}")
        # if not self.connected:
        #     logging.debug("Connection already closed")
        #     return
        # if self.closing:
        #     logging.debug("Closing websocket")
        #     self.ws.keep_running = False
        #     self.close()
        #     self.closing = False
        #     return
        # if "on_close" in self._callback:
        #     GLib.idle_add(self._callback['on_close'], "Lost Connection to Moonraker")
        logging.info("Moonraker Websocket Closed")
        # self.connected = False
    @staticmethod
    def on_error(*args):
        error = args[1] if len(args) == 2 else args[0]
        logging.debug(f"Websocket error: {error}")
    @property
    def get_url(self):
        return f"{self.host}:{self.port}"
    @property
    def get_ws_protocol(self):
        if int(self.port) in {443, 7130}:
            return "wss"
        return "ws"
    @property
    def get_http_protocol(self):
        if int(self.port) in {443, 7130}:
            return "https"
        return "http"
    def get_server_info(self):
        return self.send_request("server/info")
    def get_printer_info(self):
        return self.send_request("printer/info")
    def get_thumbnail_stream(self, thumbnail):
        return self.send_request(f"server/files/gcodes/{thumbnail}", json=False)
    def get_oneshot_token(self):
        r = self.send_request("access/oneshot_token")
        if r is False or 'result' not in r:
            return False
        return r['result']
    def send_request(self, method, json=True):
        url = f"{self.get_http_protocol}://{self.host}:{self.port}/{method}"
        headers = {}
        data = False
        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()
            if json:
                logging.debug(f"Sending request to {url}")
                data = response.json()
            else:
                data = response.content
        except requests.exceptions.HTTPError as h:
            self.status = self.format_status(h)
        except requests.exceptions.ConnectionError as c:
            self.status = self.format_status(c)
        except requests.exceptions.Timeout as t:
            self.status = self.format_status(t)
        except requests.exceptions.JSONDecodeError as j:
            self.status = self.format_status(j)
        except requests.exceptions.RequestException as r:
            self.status = self.format_status(r)
        except Exception as e:
            self.status = self.format_status(e)
        if data:
            self.status = ''
        else:
            logging.error(self.status.replace('\n', '>>'))
        return data

    @staticmethod
    def format_status(status):
        try:
            rep = {"HTTPConnectionPool": "", "/server/info ": "", "Caused by ": "", "(": "", ")": "",
                   ": ": "\n", "'": "", "`": "", "\"": ""}
            rep = {re.escape(k): v for k, v in rep.items()}
            pattern = re.compile("|".join(rep.keys()))
            status = pattern.sub(lambda m: rep[re.escape(m.group(0))], f"{status}").split("\n")
            return "\n".join(_ for _ in status if "urllib3" not in _ and _ != "")
        except TypeError or KeyError:
            return status

