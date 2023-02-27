import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Rectangle {
    id: controlPage
    visible: false
    width: parent.width
    height: parent.height
    color: msStyle.background

    property StackView stack: null

    Grid {
        id: controlPageView
        width: parent.width
        height: parent.height

        rows: 2
        columns: 3
        spacing: msSettings.spacing
        leftPadding: msSettings.spacing
        rightPadding: msSettings.spacing

        property int buttonWidth: (width - spacing * (columns > 0 ? columns - 1 : 0) - spacing * 2) / (columns > 0 ? columns : 1)
        property int buttonHeight: (height - spacing * (rows > 0 ? rows - 1 : 0) - spacing) / (rows > 0 ? rows : 1)

        BaseButton {
            text: qsTr("Temperature")
            width: controlPageView.buttonWidth
            height: controlPageView.buttonHeight
            backColor : msStyle.buttonColor1

            bottomLine: true
            onClicked: {
                console.log("Temperature Screen$Not$")
                //                settingsPage.visible = true;
                //                settingsPage.stack = stack;
                //                stack.push(settingsPage)
            }
        }
        BaseButton {
            text: qsTr("Fan")
            width: controlPageView.buttonWidth
            height: controlPageView.buttonHeight
            backColor : msStyle.buttonColor3

            bottomLine: true
            onClicked: {
                console.log("Fan Screen$Not$")
                //                settingsPage.visible = true;
                //                settingsPage.stack = stack;
                //                stack.push(settingsPage)
            }
        }
        BaseButton {
            text: qsTr("Filament")
            width: controlPageView.buttonWidth
            height: controlPageView.buttonHeight
            backColor : msStyle.buttonColor2

            bottomLine: true
            onClicked: {
                console.log("Filament Screen$Not$")
                //                settingsPage.visible = true;
                //                settingsPage.stack = stack;
                //                stack.push(settingsPage)
            }
        }
        BaseButton {
            text: qsTr("Home")
            width: controlPageView.buttonWidth
            height: controlPageView.buttonHeight
            backColor : msStyle.buttonColor4

            bottomLine: true
            onClicked: {
                console.log("Home Screen$Not$")
                homePage.visible = true;
                homePage.stack = stack;
                stack.push(homePage)
            }
        }
        BaseButton {
            text: qsTr("Level")
            width: controlPageView.buttonWidth
            height: controlPageView.buttonHeight
            backColor : msStyle.buttonColor3

            bottomLine: true
            onClicked: {
                console.log("Level Screen$Not$")
                //                settingsPage.visible = true;
                //                settingsPage.stack = stack;
                //                stack.push(settingsPage)
            }
        }
        BaseButton {
            text: qsTr("Move")
            width: controlPageView.buttonWidth
            height: controlPageView.buttonHeight
            backColor : msStyle.buttonColor1

            bottomLine: true
            onClicked: {
                console.log("Move Screen$Not$")
//                settingsPage.visible = true;
//                settingsPage.stack = stack;
//                stack.push(settingsPage)
            }
        }
    }

    HomePage {
        id: homePage
        width: parent.width
        height: parent.height
    }
}
