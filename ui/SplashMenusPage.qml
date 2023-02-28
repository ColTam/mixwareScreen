import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Rectangle {
    id: menusPage
    visible: false
    width: parent.width
    height: parent.height
    color: msStyle.background

    property StackView stack: null

    Grid {
        id: menusPageView
        width: parent.width
        height: parent.height

        rows: 1
        columns: 3
        spacing: msSettings.spacing
        leftPadding: msSettings.spacing
        rightPadding: msSettings.spacing

        property int buttonWidth: (width - spacing * (columns > 0 ? columns - 1 : 0) - spacing * 2) / (columns > 0 ? columns : 1)
        property int buttonHeight: (height - spacing * (rows > 0 ? rows - 1 : 0) - spacing) / (rows > 0 ? rows : 1)

        BaseButton {
            id: btn
            text: qsTr("Wifi")
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight
            backColor : msStyle.buttonColor1

            bottomLine: true
            onClicked: {
                console.log("Wifi Screen$Not$")
            }
        }
        BaseButton {
            text: qsTr("System")
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight
            backColor : msStyle.buttonColor2

            bottomLine: true
            onClicked: {
                console.log("System Screen$Not$")
            }
        }
        BaseButton {
            id: settingBtn
            text: qsTr("Settings")
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight
            backColor : msStyle.buttonColor3

            bottomLine: true
            onClicked: {
                settingsPage.visible = true;
                settingsPage.stack = stack;
                stack.push(settingsPage, StackView.Immediate)
            }
        }
    }

    SettingsPage {
        id: settingsPage
        width: parent.width
        height: parent.height
    }
}
