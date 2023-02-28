import configparser
import os.path

# This Python file uses the following encoding: utf-8
from PyQt5 import QtCore


class MixwareScreenConfig(QtCore.QObject):
    config_file_name = "MixwareScreen.conf"

    def __init__(self, dir):
        super().__init__()
        self.screen_height = 0
        self.lang = None
        self.config = configparser.ConfigParser()
        self.config.read(dir + MixwareScreenConfig.config_file_name)
        if len(self.config) > 1:
            self.screen_height = self.config.get('window', 'height')
            self.lang = self.config.get('set', 'language')

    @QtCore.pyqtSlot(str, result=str)
    def get_option(self, opt):
        return self.config.get('set', opt)
