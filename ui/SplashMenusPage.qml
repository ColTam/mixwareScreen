import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import Qt.labs.settings


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
        spacing: 5
        padding: 5
        topPadding: 0
        bottomPadding: 0

        property int buttonWidth: 0
        property int buttonHeight: 0

        onWidthChanged: {
            updateButtonSize()
        }
        onHeightChanged: {
            updateButtonSize()
        }

        BaseButton {
            id: btn
            text: qsTr("Wifi")
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight
            backColor : msStyle.buttonColor1
            bottomLine: true
            onClicked: console.log("Wifi Screen$Not$")
        }
        BaseButton {
            text: qsTr("System")
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight
            backColor : msStyle.buttonColor2
            bottomLine: true
            onClicked: console.log("System Screen$Not$")
        }
        BaseButton {
            id: settingBtn
            text: qsTr("Settings")
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight

            backColor : msStyle.buttonColor3

            onClicked: {
                screenLogger.info("debug")
                page2.visible = true;
                page2.stack = stack;
                stack.push(page2)
            }
        }
        SettingsPage {
            id: page2
            width: splashPage.width
            height: splashPage.height
        }

        function updateButtonSize() {
            buttonWidth = (width-spacing*(columns>0?columns-1:0)-padding*2)/(columns>0?columns:1)
            buttonHeight = (height-spacing*(rows>0?rows-1:0)-padding)/(rows>0?rows:1)
        }
    }
}
