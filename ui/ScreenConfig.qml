import QtQuick 2.9
import Qt.labs.settings 1.0

Settings {
    id: set
    fileName: appDir + "MixwareScreen.conf"

    category: "set"
    property bool autoCloseEnabled: screenConfig.get_option('autoCloseEnabled')
    property bool heaterPowerEnabled: screenConfig.get_option('heaterPowerEnabled')
    property bool hoursSwitchEnabled: screenConfig.get_option('hoursSwitchEnabled')
    property bool dmpsSwitchEnabled: screenConfig.get_option('dmpsSwitchEnabled')
    property bool stopSwitchEnabled: screenConfig.get_option('stopSwitchEnabled')
    property int theme: screenConfig.get_option('theme')
    property int time: screenConfig.get_option('time')
    property int closeDisplay: screenConfig.get_option('closeDisplay')
    property int fontSize: screenConfig.get_option('fontSize')
    property int language : screenConfig.get_option('language') // read
    property int radius: 10
    property int spacing: 5
}
