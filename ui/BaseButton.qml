import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Button {
    id: control
    flat: true
    text: qsTr("Button")

    Material.theme: Material.Light
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#17a81a" : "#21be2b"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        color: control.down ? "#ff5a00" : control.hovered ? "#ffaa55" : "red"
        radius: 5

        Rectangle {
            height: parent.radius * 2
            width: parent.width
            color: parent.color.darker()
            radius: parent.radius

            anchors.bottom: parent.bottom
        }

        Rectangle {
            y: parent.height - parent.radius * 3
            height: parent.radius * 2
            width: parent.width
            color: parent.color
            radius: parent.radius
        }
    }

}
