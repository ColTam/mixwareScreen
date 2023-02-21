import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings

ApplicationWindow {
    id: window
    visible: true
    width: 320
    height: 540

    minimumWidth: 240
    minimumHeight: 320
    title: qsTr("Mixware Screen")
//    flags: Qt.FramelessWindowHint

    Settings {
        id: winset
        fileName: "./MixwareScreen.conf"

        category: "window"
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }

    ScreenConfig {
        id: msSettings
    }

    ScreenStyle {
        id: msStyle
    }

    header: Rectangle {
        id: mainHeader
        height: headerTitle.height

        anchors.topMargin: 2
        anchors.bottomMargin: 3

        color: msStyle.background
        BaseLabel {
            id: headerTitle
            text: qsTr("        Mixware Screen")
            width: parent.width - headerTime.width

            horizontalAlignment: Text.AlignHCenter
        }

        BaseLabel {
            id: headerTime
            text: Qt.formatDateTime(new Date(), "hh:mm")

            anchors.right: parent.right
            anchors.rightMargin: 6
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: headerTime.text = Qt.formatDateTime(new Date(), "hh:mm")
            }
        }
    }

    footer: BaseTabBar {
        id: mainFooter
        height: 48
        width: parent.width
    }

    StackView {
        id: stack
        width: parent.width
        anchors.top: mainHeader.bottom
        anchors.bottom: mainFooter.top

        initialItem: SplashPage {
            id: splash
            width: stack.width
            height: stack.height
        }
    }

    Component.onCompleted: {
//        window.visibility = Window.Maximized
        screenLogger.info("Mixware Scrren Start")
    }
}
