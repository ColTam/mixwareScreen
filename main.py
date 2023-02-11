
import sys

from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QGuiApplication


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.quit.connect(app.quit)
    engine.load('ui/mixwareScreen.qml')

    sys.exit(app.exec())