import sys

from PySide6 import QtCore
from PySide6.QtCore import QTranslator
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QGuiApplication


class Translation(QtCore.QObject):
    translators = {
        'en': QTranslator(),
        'cn': QTranslator(),
        'fr': QTranslator(),
        'sp': QTranslator(),
    }
    languageChanged = QtCore.Signal()

    def __init__(self, app):
        super().__init__(app)
        self.app = app

    @QtCore.Slot(str)
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
    app = QGuiApplication(sys.argv)
    app.setOrganizationName("Mixware")
    app.setOrganizationDomain("www.mixwarebot.com")
    app.setApplicationName("MixwareScreen")

    ts = Translation(app)
    ts.languageChanged.connect(QQmlApplicationEngine().retranslate)

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("translator", ts)
    engine.quit.connect(app.quit)
    engine.load('ui/MixwareScreen.qml')

    sys.exit(app.exec())
