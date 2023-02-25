import QtQuick 2.9
import QtQuick.Controls 2.5

Label {
    id: label

    font.weight: msSettings.fontSize
    font.pixelSize: {
        switch (msSettings.fontSize) {
        case Font.Light: return 11
        case Font.Normal: return 14
        case Font.Bold: return 20
        default: return 14
        }
    }

    font.italic: false
    color: msStyle.foreground

    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
}
