import QtQuick 2.9
import QtQuick.Controls 2.5

Button {
    id: control
    flat: true
    text: qsTr("Button")

    property color backColor : winconf.background
    property color textColor : winconf.foreground
    property color backDownColor : backColor.darker()
    property color textDownColor : textColor.lighter()
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
        radius: 10

        Rectangle {
            visible: bottomLine
            height: radius * 3
            width: parent.width
            color: parent.color.darker()
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
            width: parent.radius
            height: parent.height
            color: parent.color.darker()
            radius: 0

            anchors.left: parent.left
        }
    }
    onLeftLineChanged: {btnBack.radius = 10}
    onBottomLineChanged: {btnBack.radius = 5}

}
