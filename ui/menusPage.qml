import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

Rectangle {
    id: menusPage
    visible: false
    width: parent.width
    height: parent.height

    property StackView stack: null

    Grid {
        id: menusPageView
        width: parent.width
        height: parent.height

        rows: 1
        columns: 3
        spacing: 5
        padding: 5

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
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight
        }
        BaseButton {
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight
            onClicked: {
                console.log(menusPageView.children)
            }
        }
        BaseButton {
            id: settingBtn
            text: qsTr("设置")
            width: menusPageView.buttonWidth
            height: menusPageView.buttonHeight

            onClicked: {
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
            buttonHeight = (height-spacing*(rows>0?rows-1:0)-padding*2)/(rows>0?rows:1)
        }
    }
}
