import configparser
import os.path
import sys
import logging

from PyQt5 import QtCore
from PyQt5.QtCore import QTranslator, qInstallMessageHandler
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtGui import QGuiApplication, QIcon

from MixwareScreenConfig import MixwareScreenConfig
from MixwareScreenLogger import MixwareScreenLogger


class Translation(QtCore.QObject):
    translators = {
        'en': QTranslator(),
        'cn': QTranslator(),
        'fr': QTranslator(),
        'sp': QTranslator(),
    }
    languageChanged = QtCore.pyqtSignal()

    def __init__(self, app):
        super().__init__(app)
        self.app = app

    @QtCore.pyqtSlot(str)
    def select_language(self, language):
        if language == "fr":
            Translation.translators['fr'].load("t1_fr", ".")
            self.app.installTranslator(Translation.translators['fr'])
        if language == "sp":
            Translation.translators['sp'].load("t1_sp", ".")
            self.app.installTranslator(Translation.translators['sp'])
        if language == "cn":
            Translation.translators['cn'].load("t1_cn", ".")
            self.app.installTranslator(Translation.translators['cn'])
        if language == "en":
            self.app.removeTranslator(Translation.translators['fr'])
            self.app.removeTranslator(Translation.translators['sp'])
            self.app.removeTranslator(Translation.translators['cn'])

        self.languageChanged.emit()


if __name__ == '__main__':
    setpath = os.path.abspath(os.path.dirname(__file__)) + "/"

    app = QGuiApplication(sys.argv)
    app.setWindowIcon(QIcon(setpath + "resource/image/Mixware.svg"))
#    app.setOrganizationName("Mixware")
#    app.setOrganizationDomain("www.mixwarebot.com")
#    app.setApplicationName("MixwareScreen")
    ms_config = MixwareScreenConfig(setpath)
    ms_logger = MixwareScreenLogger()
    ms_logger.log_file = setpath + "MixwareScreen.log"
    ms_logger.software_version = "1.0"
    ms_logger.setup_logging()

    ts = Translation(app)
    ts.languageChanged.connect(QQmlApplicationEngine().retranslate)

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("translator", ts)
    engine.rootContext().setContextProperty("screenConfig", ms_config)
    engine.rootContext().setContextProperty("screenLogger", ms_logger)
    engine.rootContext().setContextProperty("appDir", setpath)
    engine.rootContext().setContextProperty("logging", logging)
    engine.quit.connect(app.quit)
    engine.load(setpath + "ui/main.qml")

    sys.exit(app.exec())
