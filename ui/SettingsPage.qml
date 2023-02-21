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
                settingsItemText: qsTr("Auto-close notifications")

                BaseSwitch {
                    id: autoCloseSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: set.autoCloseEnabled
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("Show Heater Power")

                BaseSwitch {
                    id: heaterPowerSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: set.heaterPowerEnabled
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("Theme")

                BaseComboBox {
                    id: themeComboBox
                    x: parent.width-width-10
                    y: (parent.height-height)/2
                    model: ["default", "light", "dark"]
                    currentIndex : set.theme
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("time")

                BaseComboBox {
                    id: timeComboBox
                    x: parent.width-width-10
                    y: (parent.height-height)/2
                    model: ["auto", "file", "size", "line"]
                    currentIndex : set.time
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("24 Hours")

                BaseSwitch {
                    id: hoursSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: set.hoursSwitchEnabled
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("Display Close Time")

                BaseComboBox {
                    id: closeDisplayComboBox
                    x: parent.width-width-10
                    y: (parent.height-height)/2
                    model: ["auto", "file", "size", "line"]
                    currentIndex : set.closeDisplay
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("Font Size")

                BaseComboBox {
                    id: fontSizeComboBox
                    x: parent.width-width-10
                    y: (parent.height-height)/2
                    model: ["auto", "file", "size", "line"]
                    currentIndex : set.fontSize
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("DMPS")

                BaseSwitch {
                    id: dmpsSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: set.dmpsSwitchEnabled
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("Stop")

                BaseSwitch {
                    id: stopSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: set.stopSwitchEnabled
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("Language")

                BaseComboBox {
                    id: languageComboBox
                    x: parent.width-width-10
                    y: (parent.height-height)/2
                    model: ["auto", "en", "cn", "fr", "jp"]
                    currentIndex : set.language
//                    onCurrentIndexChanged: winconf.lang = currentIndex
                    onCurrentIndexChanged: {
                        set.language = currentIndex // save
                    }
                }
            }
        }
    }

    Settings {
        id: set
        fileName: "./MixwareScreen.conf"

        category: "set"
        property bool autoCloseEnabled: autoCloseSwitch.checked
        property bool heaterPowerEnabled: heaterPowerSwitch.checked
        property bool hoursSwitchEnabled: hoursSwitch.checked
        property bool dmpsSwitchEnabled: dmpsSwitch.checked
        property bool stopSwitchEnabled: stopSwitch.checked
        property int theme: themeComboBox.currentIndex
        property int time: timeComboBox.currentIndex
        property int closeDisplay: closeDisplayComboBox.currentIndex
        property int fontSize: fontSizeComboBox.currentIndex
        property int language : screenConfig.get_valus('language') // read
    }

    function debugLog(str) {
        console.log(str)
    }
}
