import QtQuick 2.9
import Qt.labs.settings

//QtObject {
//    id: config

//    property color background_1 : configSettings.background_1


//}
Settings {
    id: configSettings
    fileName: "./resource/style.conf"

    category: "style"
    property color foreground
    property color background
    property color accent
    property color primary

    property color buttonColor1
    property color buttonColor2
    property color buttonColor3
    property color buttonColor4
}
