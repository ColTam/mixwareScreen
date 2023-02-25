import QtQuick 2.9
import QtQuick.Controls 2.5

Rectangle {
    id: tabBar

    width: parent.width
    height: parent.height

    property StackView stack: null

    BaseTabButton {
        id: returnTabButton
        enabled: stack.depth > 1 ? true : false
        width: parent.width / 3
        height: parent.height
        anchors.left: parent.left
        BaseLabel {
            text: qsTr("Return")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (stack.depth > 1)
                    stack.pop()
            }
        }
    }
    BaseTabButton {
        id: homeTabButton
        enabled: stack.depth > 1 ? true : false
        width: parent.width / 3
        height: parent.height
        anchors.centerIn: parent
        BaseLabel {
            text: qsTr("Start")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (stack.depth > 1)
                    stack.pop(null)
            }
        }
    }
    BaseTabButton {
        id: restartTabButton
        enabled: true
        width: parent.width / 3
        height: parent.height
        anchors.right: parent.right
        BaseLabel {
            text: qsTr("Stop")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("重启，待实现")
            }
        }
    }
}
