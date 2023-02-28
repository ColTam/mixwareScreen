import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Page {
    id: splashPageBody
    visible: false
    width: parent.width
    height: parent.height

    property StackView stack: null

    Rectangle {
        width: parent.width
        height: parent.height - mainBottom.height

        color: msStyle.background
        Rectangle {
            width: parent.width / 2
            height: parent.height
            anchors.centerIn: parent
            color: parent.color
            Image {
                id: logo
                width: parent.width
                height: 96
                y: (parent.height - height) / 2
                source: "../resource/image/Mixware.svg"
                horizontalAlignment: Text.AlignHCenter

                fillMode: Image.PreserveAspectFit
            }

            BaseLabel {
                text: "Mixware Screen"
                width: parent.width

                anchors.top: logo.bottom
                horizontalAlignment: Text.AlignHCenter
            }
        }

    }

    Rectangle {
        id: mainBottom

        anchors.bottom: parent.bottom
        color: msStyle.background
        height: 42
        width: parent.width

        BaseButton {
            text: qsTr("Reboot")

            width: parent.width / 3
            height: parent.height
            onClicked: {
                console.log("Restart Klipper$Not$")
                screenLogger.reboot()
            }
        }
        BaseButton {
            text: qsTr("Shutdown")
            x: (parent.width - width) / 2
            width: parent.width / 3
            height: parent.height
            onClicked: {
                console.log("Restart Firmware$Not$")
            }
        }
        BaseButton {
            text: qsTr("Menus")
            anchors.right: parent.right
            width: parent.width / 3
            height: parent.height

            onClicked: {
//                translator.select_language("cn")
                splashMenuspage.visible = true;
                splashMenuspage.stack = stack;
                stack.push(splashMenuspage, StackView.Immediate)
            }
        }
    }

    SplashMenusPage {
        id: splashMenuspage
        width: parent.width
        height: parent.height
    }
}
