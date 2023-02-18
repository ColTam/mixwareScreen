import QtQuick 2.9
import QtQuick.Controls 2.5

Button {
    id: tabButton
    flat: true
    enabled: true

    opacity: enabled ? 1 : 0.5

    contentItem: Text {
        color: winconf.foreground
    }

    background: Rectangle {
        color: winconf.background
    }

    Rectangle {
        width: parent.width
        height: 3
        color: winconf.accent
        anchors.top: parent.top
    }
}
