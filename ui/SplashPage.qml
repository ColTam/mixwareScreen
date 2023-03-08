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

    // header section
    Rectangle {
        id: splashHeader
        width: parent.width
        height: splashHeaderTitle.height
        color: msStyle.background
        z: 99

        // Title section
        BaseLabel {
            id: splashHeaderTitle
            text: qsTr("Mixware Screen")
            x: (parent.width - width) / 2
        }
        // System time section
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
    // Page Control section
    BaseTabBar {
        id: splashFooter
        height: 48
        width: parent.width
        anchors.bottom: parent.bottom
        z: 88

        stack: splashStack
    }
    // Body section
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
            splashStack.pop(null, StackView.Immediate)


//        console.log(Qt.fontFamilies())
//        console.log(Font.Thin, Font.Light, Font.Normal, Font.Medium, Font.Bold, Font.Black)
    }
}
