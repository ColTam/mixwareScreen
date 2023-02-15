import QtQuick 2.9
import QtQuick.Controls 2.5

Rectangle {
    id: tabBar

    width: parent.width
    height: parent.height

    Rectangle {
        width: parent.width/3
        height: parent.height
        anchors.left: parent.left
        Label {
            text: qsTr("返回")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (stack.depth > 1)
                    stack.pop()
            }
        }
        Rectangle {
            width: parent.width
            height: 2
            radius: 4
            color: "#FF5A00"
            anchors.bottom: parent.bottom
        }
    }
    Rectangle {
        width: parent.width/3
        height: parent.height
        anchors.centerIn: parent
        Label {
            text: qsTr("主页")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (stack.depth > 1)
                    stack.pop(null)
            }
        }
        Rectangle {
            width: parent.width
            height: 2
            radius: 4
            color: "#FF5A00"
            anchors.bottom: parent.bottom
        }
    }
    Rectangle {
        width: parent.width/3
        height: parent.height
        anchors.right: parent.right
        Label {
            text: qsTr("重启")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("重启，待实现")
            }
        }
        Rectangle {
            width: parent.width
            height: 2
            radius: 4
            color: "#FF5A00"
            anchors.bottom: parent.bottom
        }
    }
}
