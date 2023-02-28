import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Window {
    id: window
    visible: true
//    visibility: Window.FullScreen
//    flags: Qt.FramelessWindowHint
    width: 400
    height: 960
    minimumWidth: 240
    minimumHeight: 320
    title: qsTr("Mixware Screen")

    Settings {
        id: windowSetting
        fileName: appDir + "/MixwareScreen.conf"

        category: "window"
        property alias x: window.x
        property alias y: window.y
    }

    ScreenConfig {
        id: msSettings
    }

    ScreenStyle {
        id: msStyle
    }

    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        color: "#fff8dc"

        BaseButton{
            id: toggleButton

            text: "Toggle"
            backColor : "#FFFFFF"

            width: parent.width
            height: 48

            anchors.bottom: parent.bottom
            anchors.right: parent.right

            onClicked: {
                if (mainStack.depth > 1)
                    mainStack.pop(null, StackView.Immediate)
                else {
                    printPage.visible = true;
                    printPage.stack = mainStack;
                    mainStack.push(printPage, StackView.Immediate)
                }
            }
        }

        StackView {
            id: mainStack
            width: parent.width
            anchors.top: parent.top
            anchors.bottom: toggleButton.top

//            initialItem: printPage
            initialItem: splashPage
        }

        SplashPage {
            id: splashPage
            width: mainStack.width
            height: mainStack.height
        }
        PrintPage {
            id: printPage
            width: mainStack.width
            height: mainStack.height
        }

    }

    Rectangle {
        id: notify
        visible: false
        height: 48
        width: parent.width
        color: msStyle.buttonColor4

        property string inf: "message"

        Label {
            text: notify.inf

            x: 16
            y: (parent.height - height) / 2
            color: msStyle.foreground
        }
        Button {
            text: "×"
            flat: true
            width: parent.height
            height: width
            anchors.right: parent.right

            onClicked: notify.visible = false
        }
    }

    function show_notify(str) {
        notify.inf = str
        notify.visible = true
    }
}
