import configparser
import os.path

from PySide6.QtCore import *


class MixwareScreenConfig(QObject):
    config_file_name = "MixwareScreen.conf"

    def __init__(self):
        super().__init__()
        self.config = configparser.ConfigParser()
        self.config.read("MixwareScreen.conf")
        self.screen_height = self.config.get('window', 'height')
        self.lang = self.config.get('set', 'language')

        print(self.screen_height)

    @Slot(str, result=str)
    def get_valus(self, sec):
        return self.config.get('set', sec)
