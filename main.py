import sys

from PySide6 import QtWidgets

from ui.ui import MainScreen


def main():
    app = QtWidgets.QApplication([])

    widget = MainScreen()
    widget.resize(800, 600)
    widget.show()

    sys.exit(app.exec())


if __name__ == '__main__':
    main()

# 访问 https://www.jetbrains.com/help/pycharm/ 获取 PyCharm 帮助
