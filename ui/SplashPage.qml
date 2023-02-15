
import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
//import QtQuick.Controls.Material 2.3

import Qt.labs.settings

Page {
    id: splashPage
    width: parent.width
    height: parent.height

    Rectangle {
        id: testrect

        width: parent.width
        height: parent.height-mainBottom.height
        color: "red"
        Label {
            text: "Mixware Screen"

            anchors.centerIn: parent
        }
    }

    Rectangle {
        id: mainBottom
        height: 42
        width: parent.width

        anchors.bottom: parent.bottom
        Button {
            id: rbtn
            text: qsTr("Return1")

            anchors.left: parent.left
            width: parent.width/3
            height: parent.height
            flat: settings.btnf

            Settings {
                id: settings
                fileName: "./MixwareScreen.conf"

                property bool btnf: true
            }

            onClicked: flat ^= true

            onFlatChanged: settings.btnf = flat
        }
        Button {
            id: tbtn
            text: qsTr("Return2")

            anchors.left: rbtn.right
            anchors.right: tsbtn.left
            width: parent.width/3
            height: parent.height
            onClicked: {
//                if (winset.theme == Material.Light) {
//                    winset.theme = Material.Dark

//                    mainFooter.tabBarModel.setProperty(0, "currentModelColor", Material.color(Material.Purple, Material.Shade200).toString())
//                    mainFooter.tabBarModel.setProperty(1, "currentModelColor", Material.color(Material.Purple, Material.Shade200).toString())
//                    mainFooter.tabBarModel.setProperty(2, "currentModelColor", Material.color(Material.Purple, Material.Shade200).toString())
//                    mainFooter.tabBarModel.setProperty(0, "modelColor", Material.color(Material.Teal, Material.Shade200).toString())
//                    mainFooter.tabBarModel.setProperty(1, "modelColor", Material.color(Material.Teal, Material.Shade200).toString())
//                    mainFooter.tabBarModel.setProperty(2, "modelColor", Material.color(Material.Teal, Material.Shade200).toString())
//                }
//                else {
//                    winset.theme = Material.Light

//                    mainFooter.tabBarModel.setProperty(0, "modelColor", Material.color(Material.Teal, Material.ShadeA700).toString())
//                    mainFooter.tabBarModel.setProperty(1, "modelColor", Material.color(Material.Teal, Material.ShadeA700).toString())
//                    mainFooter.tabBarModel.setProperty(2, "modelColor", Material.color(Material.Teal, Material.ShadeA700).toString())
//                    mainFooter.tabBarModel.setProperty(0, "currentModelColor", Material.color(Material.Purple, Material.ShadeA700).toString())
//                    mainFooter.tabBarModel.setProperty(1, "currentModelColor", Material.color(Material.Purple, Material.ShadeA700).toString())
//                    mainFooter.tabBarModel.setProperty(2, "currentModelColor", Material.color(Material.Purple, Material.ShadeA700).toString())
//                }
            }
        }
        Button {
            id: tsbtn
            text: qsTr("菜单")
            anchors.right: parent.right
            width: parent.width/3
            height: parent.height

            onClicked: {
                translator.select_language("cn")
                page1.visible = true;
                page1.stack = stack;
                stack.push(page1)
            }
        }
    }

    MenusPage {
        id: page1
        width: splashPage.width
        height: splashPage.height
    }
}
