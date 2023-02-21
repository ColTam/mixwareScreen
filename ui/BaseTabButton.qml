import QtQuick 2.9
import QtQuick.Controls 2.5

Button {
    id: tabButton
    flat: true
    enabled: true

    opacity: enabled ? 1 : 0.5

    contentItem: Text {
        color: style.foreground
    }

    background: Rectangle {
        color: msStyle.background
    }

    Rectangle {
        width: parent.width
        height: 3
        color: msStyle.accent
        anchors.top: parent.top
    }
}
