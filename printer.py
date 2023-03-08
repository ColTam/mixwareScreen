import logging

from PyQt5 import QtCore
from PyQt5.QtCore import QTimer

from moonraker import Moonraker


class Printer(QtCore.QObject):
    temp = {}
    filelist = {}
    state = None
    # _screen = None
    update_state = QtCore.pyqtSignal(str)
    def __init__(self):
        super(Printer, self).__init__()
        self.moonraker = Moonraker(self)
        self.moonraker.connect()

        self.timer = QTimer(self)
        self.timer.timeout.connect(self.update_temp)
        self.timer.start(1000)

    @QtCore.pyqtSlot()
    def update_temp(self):
        self.moonraker.send_method("server.temperature_store")
        # self.moonraker.send_method("printer.objects.query", {
        #     "objects": {
        #         "webhooks": null,
        #         "virtual_sdcard": null,
        #         "print_stats": null
        #     }
        # })

    @QtCore.pyqtSlot(str, bool, bool, result=str)
    def get_temperatures(self, section, show_target=False, show_power=False):
        data = int(self.temp[section]['temperatures'][-1])
        label = f"{data:3}"

        data = int(self.temp[section]['targets'][-1])
        if show_target and data:
            label += f"/{data}"

        label += "°"

        if show_power and data:
            data = int(self.temp[section]['powers'][-1])
            label += f" {data * 100:3}%"

        return label

    @QtCore.pyqtSlot(str)
    def gcode_script(self, script, callback=None, *args):
        logging.debug(f"Sending printer.gcode.script: {script}")
        return self.moonraker.send_method(
            "printer.gcode.script",
            {"script": script},
            callback,
            *args
        )

    @QtCore.pyqtSlot(str, int)
    def set_temperatures(self, heater, target):
        logging.debug(f"Sending heater {heater} to temp: {target}")
        self.gcode_script(f'SET_HEATER_TEMPERATURE heater="{heater}" target={target}')
    @QtCore.pyqtSlot(str, float)
    def set_fan_speed(self, fan, speed):
        logging.debug(f"Sending FAN {fan} to SPEED: {speed}")
        self.gcode_script(f'SET_FAN_SPEED FAN="{fan}" SPEED={speed}')

    @QtCore.pyqtSlot()
    def restart_klipper(self):
        logging.debug("Sending printer.restart")
        return self.moonraker.send_method("printer.restart")

    @QtCore.pyqtSlot()
    def restart_firmware(self):
        logging.debug("Sending printer.firmware_restart")
        return self.moonraker.send_method("printer.firmware_restart")

    def print_cancel(self, callback=None, *args):
        logging.debug("Sending printer.print.cancel")
        return self.moonraker.send_method(
            "printer.print.cancel",
            {},
            callback,
            *args
        )

    def print_pause(self, callback=None, *args):
        logging.debug("Sending printer.print.pause")
        return self.moonraker.send_method(
            "printer.print.pause",
            {},
            callback,
            *args
        )

    def print_resume(self, callback=None, *args):
        logging.debug("Sending printer.print.resume")
        return self.moonraker.send_method(
            "printer.print.resume",
            {},
            callback,
            *args
        )

    def print_start(self, filename, callback=None, *args):
        logging.debug("Sending printer.print.start")
        return self.moonraker.send_method(
            "printer.print.start",
            {
                "filename": filename
            },
            callback,
            *args
        )

    @QtCore.pyqtSlot()
    def get_file_list(self, callback=None, *args):
        logging.debug("Sending server.files.list")
        return self.moonraker.send_method(
            "server.files.list",
            {},
            callback,
            *args
        )

    @QtCore.pyqtSlot()
    def emergency_stop(self):
        logging.info("Sending printer.emergency_stop")
        return self.moonraker.send_method(
            "printer.emergency_stop"
        )

    def update_states(self, _state):
        self.update_state.emit(_state)