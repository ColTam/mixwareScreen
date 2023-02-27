import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Rectangle {
    id: homePage
    visible: false
    width: parent.width
    height: parent.height
    color: msStyle.background

    property StackView stack: null

    Grid {
        id: gridView
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
            text: qsTr("Home X Left")
            width: gridView.buttonWidth
            height: gridView.buttonHeight
            backColor : msStyle.buttonColor1

            bottomLine: true
            onClicked: {
                console.log("Home X-L $Not$")
            }
        }
        BaseButton {
            text: qsTr("Home Y")
            width: gridView.buttonWidth
            height: gridView.buttonHeight
            backColor : msStyle.buttonColor3

            bottomLine: true
            onClicked: {
                console.log("Home Y $Not$")
            }
        }
        BaseButton {
            text: qsTr("Home X Right")
            width: gridView.buttonWidth
            height: gridView.buttonHeight
            backColor : msStyle.buttonColor2

            bottomLine: true
            onClicked: {
                console.log("Home X-R $Not$")
            }
        }
        BaseButton {
            text: qsTr("Home Z")
            width: gridView.buttonWidth
            height: gridView.buttonHeight
            backColor : msStyle.buttonColor4

            bottomLine: true
            onClicked: {
                console.log("Home Z $Not$")
            }
        }
        BaseButton {
            text: qsTr("Home All")
            width: gridView.buttonWidth
            height: gridView.buttonHeight
            backColor : msStyle.buttonColor3

            bottomLine: true
            onClicked: {
                console.log("Home All $Not$")
            }
        }
        BaseButton {
            text: qsTr("Disabled Motor")
            width: gridView.buttonWidth
            height: gridView.buttonHeight
            backColor : msStyle.buttonColor1

            bottomLine: true
            onClicked: {
                console.log("Disabled Motor $Not$")
            }
        }
    }
}
