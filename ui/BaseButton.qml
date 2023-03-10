import QtQuick 2.9
import QtQuick.Controls 2.5

Button {
    id: control
    flat: true

    font.weight: msSettings.fontSize
    font.pixelSize: {
        switch (msSettings.fontSize) {
        case Font.Light: return 11
        case Font.Normal: return 14
        case Font.Bold: return 20
        default: return 14
        }
    }

    property color backColor : msStyle.background
    property color textColor : msStyle.foreground
    property color backDownColor : Qt.darker(backColor)
    property color textDownColor : Qt.darker(textColor)
    property bool bottomLine: false
    property bool leftLine: false

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? textDownColor : textColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        id: btnBack
        anchors.fill: parent
        opacity: enabled ? 1 : 0.3
        color: control.down ? backDownColor : backColor
        radius: msSettings.radius

        Rectangle {
            visible: bottomLine
            height: radius * 3
            width: parent.width
            color: Qt.darker(parent.color)
            radius: parent.radius

            anchors.bottom: parent.bottom
        }

        Rectangle {
            visible: bottomLine
            y: parent.height - height * 1.3
            height: radius * 2
            width: parent.width
            color: parent.color
            radius: parent.radius * 1.5
        }

        Rectangle {
            visible: leftLine
            width: parent.radius / 2
            height: parent.height
            color: Qt.darker(parent.color)
            radius: 0

            anchors.left: parent.left
        }
    }
}
