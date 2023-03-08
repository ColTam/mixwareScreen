import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Page {
    id: printingPage
    visible: false
    width: parent.width
    height: parent.height

    property StackView stack: null

    BaseLabel {
        anchors.centerIn: parent
        text: "Printing"
    }

    onVisibleChanged: printer.get_file_list()
}
