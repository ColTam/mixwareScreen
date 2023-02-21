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

    color: msStyle.background

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
                    checked: msSettings.autoCloseEnabled
                    onCheckedChanged: {
                        msSettings.autoCloseEnabled = checked
                    }
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("Show Heater Power")

                BaseSwitch {
                    id: heaterPowerSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: msSettings.heaterPowerEnabled
                    onCheckedChanged: {
                        msSettings.heaterPowerEnabled = checked
                    }
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
                    currentIndex : msSettings.theme
                    onCurrentIndexChanged: {
                        msSettings.theme = currentIndex // save
                    }
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
                    currentIndex : msSettings.time
                    onCurrentIndexChanged: {
                        msSettings.time = currentIndex // save
                    }
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("24 Hours")

                BaseSwitch {
                    id: hoursSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: msSettings.hoursSwitchEnabled
                    onCheckedChanged: {
                        msSettings.hoursSwitchEnabled = checked
                    }
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
                    currentIndex : msSettings.closeDisplay
                    onCurrentIndexChanged: {
                        msSettings.closeDisplay = currentIndex // save
                    }
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
                    currentIndex : msSettings.fontSize
                    onCurrentIndexChanged: {
                        msSettings.fontSize = currentIndex // save
                    }
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("DMPS")

                BaseSwitch {
                    id: dmpsSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: msSettings.dmpsSwitchEnabled
                    onCheckedChanged: {
                        msSettings.dmpsSwitchEnabled = checked
                    }
                }
            }
            BaseSettingsItem {
                width: settingPageScrollView.availableWidth - parent.spacing * 2
                settingsItemText: qsTr("Stop")

                BaseSwitch {
                    id: stopSwitch
                    x: parent.width-width
                    y: (parent.height-height)/2
                    checked: msSettings.stopSwitchEnabled
                    onCheckedChanged: {
                        msSettings.stopSwitchEnabled = checked
                    }
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
                    currentIndex : msSettings.language
                    onCurrentIndexChanged: {
                        msSettings.language = currentIndex // save
                    }
                }
            }
        }
    }
}
