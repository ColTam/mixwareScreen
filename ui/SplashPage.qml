import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Rectangle {
    id: splashPage
    visible: false
    width: parent.width
    height: parent.height

    property StackView stack: splashStack

    Rectangle {
        id: splashHeader
        width: parent.width
        height: splashHeaderTitle.height
        color: msStyle.background

        BaseLabel {
            id: splashHeaderTitle
            text: qsTr("Mixware Screen")
            x: (parent.width - width) / 2
        }

        BaseLabel {
            id: splashHeaderTime
            text: Qt.formatDateTime(new Date(), "hh:mm")

            anchors.right: parent.right
            anchors.rightMargin: msSettings.spacing
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: splashHeaderTime.text = Qt.formatDateTime(new Date(), "hh:mm")
            }
        }
    }

    BaseTabBar {
        id: splashFooter
        height: 48
        width: parent.width
        anchors.bottom: parent.bottom

        stack: splashStack
    }

    StackView {
        id: splashStack

        width: parent.width
        anchors.top: splashHeader.bottom
        anchors.bottom: splashFooter.top

        initialItem: SplashPageBody {
            width: splashStack.width
            height: splashStack.height
            stack: splashStack
        }
    }

    onVisibleChanged: {
        if (splashStack.depth > 1)
            splashStack.pop(null)


//        console.log(Qt.fontFamilies())
//        console.log(Font.Thin, Font.Light, Font.Normal, Font.Medium, Font.Bold, Font.Black)
    }
}
