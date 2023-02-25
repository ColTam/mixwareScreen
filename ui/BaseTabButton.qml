import QtQuick 2.9
import QtQuick.Controls 2.5

Button {
    id: tabButton
    flat: true
    enabled: true

    opacity: enabled ? 1 : 0.5

    font.weight: msSettings.fontSize
    font.pixelSize: {
        switch (msSettings.fontSize) {
        case Font.Light: return 11
        case Font.Normal: return 14
        case Font.Bold: return 20
        default: return 14
        }
    }

    contentItem: Text {
        color: msStyle.foreground
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
