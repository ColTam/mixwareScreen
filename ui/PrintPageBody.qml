import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Page {
    id: printPageBody
    visible: false
    width: parent.width
    height: parent.height

    property StackView stack: null

    Column {
        spacing: msSettings.spacing

        x: spacing
        y: spacing

        width: parent.width - spacing * 2
        height: parent.height / 2 - spacing
        Row {
            width: parent.width
            height: (parent.height - spacing * 2) / 3
            spacing: parent.spacing

            BaseButton {
                width: (parent.width - parent.spacing) / 2
                height: parent.height
                leftLine: true

                onClicked: {
                }
            }
            BaseLabel {
                id: extLeft
                width: (parent.width - parent.spacing) / 2
                height: parent.height

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (numberPad.visible) {
                            numberPad.visible = false
                        }
                        else {
                            numberPad.visible = true
                            numberPad.heater = "extruder"
                        }
                    }
                }
            }
        }
        Row {
            width: parent.width
            height: (parent.height - spacing * 2) / 3
            spacing: parent.spacing

            BaseButton {
                width: (parent.width - parent.spacing) / 2
                height: parent.height
                leftLine: true

                onClicked: {
                }
            }
            BaseLabel {
                id: extRight
                width: (parent.width - parent.spacing) / 2
                height: parent.height

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (numberPad.visible) {
                            numberPad.visible = false
                        }
                        else {
                            numberPad.visible = true
                            numberPad.heater = "extruder1"
                        }
                    }
                }
            }
        }
        Row {
            width: parent.width
            height: (parent.height - spacing * 2) / 3
            spacing: parent.spacing

            BaseButton {
                width: (parent.width - parent.spacing) / 2
                height: parent.height
                leftLine: true

                onClicked: {
                }
            }
            BaseLabel {
                id: bed
                width: (parent.width - parent.spacing) / 2
                height: parent.height

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (numberPad.visible) {
                            numberPad.visible = false
                        }
                        else {
                            numberPad.visible = true
                            numberPad.heater = "heater_bed"
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        height: parent.height / 2 - msSettings.spacing * 2
        width: parent.width - msSettings.spacing * 2

        x: msSettings.spacing
        y: parent.height / 2 + msSettings.spacing

        color: msStyle.background

        BaseButton {
            text: qsTr("Print")
            width: parent.width
            height: (parent.height - msSettings.spacing) / 2
            backColor : msStyle.buttonColor1

            onClicked: {
                printFilePage.visible = true;
                printFilePage.stack = stack;
                stack.push(printFilePage, StackView.Immediate)
            }
        }
        BaseButton {
            text: qsTr("Control")
            width: (parent.width - msSettings.spacing) / 2
            height: (parent.height - msSettings.spacing) / 2
            anchors.bottom: parent.bottom
            backColor : msStyle.buttonColor2

            onClicked: {
                controlPage.visible = true;
                controlPage.stack = stack;
                stack.push(controlPage, StackView.Immediate)
            }
        }
        BaseButton {
            text: qsTr("Configurate")
            width: (parent.width - msSettings.spacing) / 2
            height: (parent.height - msSettings.spacing) / 2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            backColor : msStyle.buttonColor3

            onClicked: {
                splashMenuspage.visible = true;
                splashMenuspage.stack = stack;
                stack.push(splashMenuspage, StackView.Immediate)
            }
        }
    }

    NumberPad {
        id: numberPad
        height: parent.height / 2
        width: parent.width

        anchors.bottom: parent.bottom
    }

    PrintFilePage {
        id: printFilePage
        width: parent.width
        height: parent.height
    }

    SplashMenusPage {
        id: splashMenuspage
        width: parent.width
        height: parent.height
    }

    ControlPage {
        id: controlPage
        width: parent.width
        height: parent.height
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            extLeft.text = printer.get_temperatures("extruder", true, msSettings.heaterPowerEnabled)
            extRight.text = printer.get_temperatures("extruder1", true, msSettings.heaterPowerEnabled)
            bed.text = printer.get_temperatures("heater_bed", true, msSettings.heaterPowerEnabled)
        }
    }
}
