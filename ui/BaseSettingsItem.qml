import QtQuick 2.9
import QtQuick.Controls 2.5

Rectangle {
    id: settingsItem

    property string settingsItemText: "SettingsItem"

    x: 5
    radius: 10
    color: msStyle.background
    width: 240
    height: 64

    BaseLabel {
        x: 10
        height: parent.height
        text: settingsItemText
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        height: 1
        width: parent.width
        color: parent.color.darker()

        anchors.bottom: parent.bottom
    }

}
