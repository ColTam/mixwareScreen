
import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
//import QtQuick.Controls.Material 2.3

import Qt.labs.settings

ApplicationWindow {

//Page {
    id: homePage

    visible: true
    width: 320
    height: 540

    Settings {
        id: winset
        fileName: "./MixwareScreen.conf"

        category: "window"
        property alias x: homePage.x
        property alias y: homePage.y
        property alias width: homePage.width
        property alias height: homePage.height
//        property int theme: Material.Light
    }
    Label {
        text: "121321313132131313"
    }

    footer: Row {
        Button {

        }
    }
}
