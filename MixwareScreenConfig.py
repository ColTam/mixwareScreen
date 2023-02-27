import configparser
import os.path

# This Python file uses the following encoding: utf-8
from PyQt5 import QtCore


class MixwareScreenConfig(QtCore.QObject):
    config_file_name = "MixwareScreen.conf"

    def __init__(self):
        super().__init__()
        self.config = configparser.ConfigParser()
        self.config.read("MixwareScreen.conf")
        self.screen_height = self.config.get('window', 'height')
        self.lang = self.config.get('set', 'language')

    @QtCore.pyqtSlot(str, result=str)
    def get_option(self, opt):
        return self.config.get('set', opt)
