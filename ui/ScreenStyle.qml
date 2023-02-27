import QtQuick 2.9
import Qt.labs.settings 1.0

Settings {
    id: style
    fileName: "./resource/style.config"

    category: "style"
    property color foreground : "#707070"
    property color background : "#EEEEEE"
    property color accent : "#009688"
    property color primary : "#607D8B"

    property color buttonColor1 : "#f38181"
    property color buttonColor2 : "#eaffd0"
    property color buttonColor3 : "#95e1d3"
    property color buttonColor4 : "#fce38a"
}
