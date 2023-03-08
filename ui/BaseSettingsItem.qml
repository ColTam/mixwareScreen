import QtQuick 2.9
import QtQuick.Controls 2.5

Rectangle {
    id: settingsItem

    property string settingsItemText: "SettingsItem"

    color: msStyle.background
    width: 240
    height: 48

    BaseLabel {
        x: msSettings.spacing * 3
        height: parent.height
        text: settingsItemText
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        x: msSettings.spacing
        height: 1
        width: parent.width - msSettings.spacing * 2
        color: Qt.darker(parent.color)

        anchors.bottom: parent.bottom
    }

}
