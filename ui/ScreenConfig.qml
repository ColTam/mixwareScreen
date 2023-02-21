import QtQuick 2.9
import Qt.labs.settings

    Settings {
        id: set
        fileName: "./MixwareScreen.conf"

        category: "set"
        property bool autoCloseEnabled: screenConfig.get_valus('autoCloseEnabled')
        property bool heaterPowerEnabled: screenConfig.get_valus('heaterPowerEnabled')
        property bool hoursSwitchEnabled: screenConfig.get_valus('hoursSwitchEnabled')
        property bool dmpsSwitchEnabled: screenConfig.get_valus('dmpsSwitchEnabled')
        property bool stopSwitchEnabled: screenConfig.get_valus('stopSwitchEnabled')
        property int theme: screenConfig.get_valus('theme')
        property int time: screenConfig.get_valus('time')
        property int closeDisplay: screenConfig.get_valus('closeDisplay')
        property int fontSize: screenConfig.get_valus('fontSize')
        property int language : screenConfig.get_valus('language') // read
    }
