import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Rectangle {
    id: printPage
    visible: false
    width: parent.width
    height: parent.height

    property StackView stack: printStack

    Rectangle {
        id: printHeader
        width: parent.width
        height: printHeaderTitle.height
        color: msStyle.background

        Row {
            anchors.fill: parent
            BaseLabel {
                text: " L: "
            }
            BaseLabel {
                text: "25°"
            }
            BaseLabel {
                text: " R: "
            }
            BaseLabel {
                text: "25°"
            }
            BaseLabel {
                text: " B: "
            }
            BaseLabel {
                text: "25°"
            }
        }

        BaseLabel {
            id: printHeaderTitle
            text: qsTr("Mixware Screen")
            x: (parent.width - width) / 2
        }

        BaseLabel {
            id: printHeaderTime
            text: Qt.formatDateTime(new Date(), "hh:mm")

            anchors.right: parent.right
            anchors.rightMargin: msSettings.spacing
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: printHeaderTime.text = Qt.formatDateTime(new Date(), "hh:mm")
            }
        }
    }

    BaseTabBar {
        id: printFooter
        height: 48
        width: parent.width
        anchors.bottom: parent.bottom

        stack: printStack
    }

    StackView {
        id: printStack

        width: parent.width
        anchors.top: printHeader.bottom
        anchors.bottom: printFooter.top

        initialItem: PrintPageBody {
            width: printStack.width
            height: printStack.height
            stack: printStack
        }
    }

    onVisibleChanged: {
        if (printStack.depth > 1)
            printStack.pop(null, StackView.Immediate)
    }
}
