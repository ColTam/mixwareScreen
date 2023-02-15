import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings

Rectangle {
    id: menusPage
    visible: false
    width: parent.width
    height: parent.height

    property StackView stack: null

    Rectangle {
        width: parent.width
        height: swit.height
        color: "#fff8dc"

        Label {
            id: swLabel
            text: qsTr("Time")
            width: parent.width - swit.width
            height: swit.height
            x: parent.x + 5

            verticalAlignment: Text.AlignVCenter
        }

        BaseSwitch {
            id: swit
            width: 60

            anchors.right: parent.right

            checked: set.check
            Settings {
                id: set
                fileName: "./MixwareScreen.conf"

                property bool check: swit.checked
            }
        }
    }
}
