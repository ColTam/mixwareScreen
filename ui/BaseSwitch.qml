import QtQuick 2.9
import QtQuick.Controls 2.5

Switch {
    id: control

    font.weight: msSettings.fontSize
    font.pixelSize: {
        switch (msSettings.fontSize) {
        case Font.Light: return 11
        case Font.Normal: return 14
        case Font.Bold: return 20
        default: return 14
        }
    }

    indicator: Rectangle {
        implicitWidth: implicitHeight * 2
        implicitHeight: radius * 2
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: msSettings.radius * 1.5
        color: control.checked ? "#17a81a" : "#ffffff"
        border.color: control.checked ? "#17a81a" : "#cccccc"

        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: radius * 2
            height: radius * 2
            radius: parent.radius
            color: control.down ? "#cccccc" : "#ffffff"
            border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#17a81a" : "#21be2b"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
