import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import Qt.labs.settings

Rectangle {
    id: settingsPage
    visible: false

    width: parent.width
    height: parent.height

    color: winconf.background

    property StackView stack: null

    ScrollView {
        id: settingPageScrollView
        anchors.fill: parent

        ScrollBar.vertical.policy: ScrollBar.AlwaysOff

        Column {
            id: spcl
            anchors.fill: parent
            spacing: 5

            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
//                color: winconf.buttonColor2
//                border.color: winconf.buttonColor3
                settingsItemText: qsTr("Item1")

                BaseSwitch {
                    id: testSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2

                    checked: set.check
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
//                color: winconf.buttonColor2
//                border.color: winconf.buttonColor3
                settingsItemText: qsTr("Item2")

                BaseComboBox {
                    id: testSwitch2
                    spacing: 5
                    rightPadding: 5
                    x: parent.width-width-10
                    y: (parent.height-height)/2


                    model: ["en", "zh_CN", "俄语", "1122334455667789", "mixware", "科栋", "666"]
                    currentIndex : set.comboIndex
//                    onActivated: {set.comboIndex = currentIndex}
//                    Component.onCompleted: currentIndex = set.comboIndex

//                    checked: set.check2
                }
            }
            BaseButton {
                id: settingBtn2
                x: 5

                text: qsTr("Settings2")
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                height: 64

                backColor : winconf.buttonColor3

                leftLine: true
                onClicked: {
                    debugLog("Settings2")
                }
            }
            BaseButton {
                id: settingBtn3
                x: 5

                text: qsTr("Settings3")
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                height: 64

                backColor : winconf.buttonColor3

                leftLine: true
                onClicked: {
                    debugLog("Settings3")
                }
            }
        }
    }

    Settings {
        id: set
        fileName: "./MixwareScreen.conf"

        property bool check: testSwitch.checked
        property int comboIndex: testSwitch2.currentIndex
    }

    function debugLog(str) {
        console.log(str)
    }
}
