
import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
//import QtGraphicalEffects 1.15

import Qt.labs.settings


Page {
    id: splashPage
    width: parent.width
    height: parent.height

    Rectangle {
        id: testrect

        width: parent.width
        height: parent.height-mainBottom.height

        color: winconf.background
        Rectangle {
            width: parent.width / 2
            height: parent.height
            anchors.centerIn: parent
            color: parent.color
            Image {
                id: img
                width: parent.width; height: 96
                y: (parent.height - height) / 2
                source: "../resource/image/Mixware.svg"
                horizontalAlignment: Text.AlignHCenter

                fillMode: Image.PreserveAspectFit
//                color: "##FF5A00"
//                ColorOverlay {

//                }
            }

            BaseLabel {
                id: lbl
                text: "Mixware Screen"
                width: parent.width

                anchors.top: img.bottom
                horizontalAlignment: Text.AlignHCenter
            }
        }

    }

    Rectangle {
        id: mainBottom

        anchors.bottom: parent.bottom
        color: winconf.background
        height: 42
        width: parent.width

        BaseButton {
            id: rbtn
            text: qsTr("Reboot")

            anchors.left: parent.left
            width: parent.width/3
            height: parent.height
            onClicked: {
                console.log("Restart Klipper$Not$")
            }
        }
        BaseButton {
            id: tbtn
            text: qsTr("Shutdown")

            anchors.left: rbtn.right
            anchors.right: tsbtn.left
            width: parent.width/3
            height: parent.height
            onClicked: {
                console.log("Restart Firmware$Not$")
            }
        }
        BaseButton {
            id: tsbtn
            text: qsTr("Menus")
            anchors.right: parent.right
            width: parent.width/3
            height: parent.height

            onClicked: {
//                translator.select_language("cn")
                page1.visible = true;
                page1.stack = stack;
                stack.push(page1)
            }
        }
    }

    SplashMenusPage {
        id: page1
        width: splashPage.width
        height: splashPage.height
    }
}
