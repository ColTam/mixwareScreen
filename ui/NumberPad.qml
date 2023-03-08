import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

import Qt.labs.settings 1.0

Rectangle {
    id: numberPad
    visible: false
    width: parent.width
    height: parent.height
    color: msStyle.background

    property int number: 0
    property string heater: ""

    Column {
        spacing: msSettings.spacing

        x: spacing
        y: spacing

        width: parent.width - spacing * 2
        height: parent.height - spacing * 2

        Rectangle {
            width: parent.width
            height: (parent.height - 20) / 5
            color: "white"

            BaseLabel {
                id: numberLabel
                anchors.centerIn: parent
                text: numberPad.number
            }

            BaseButton {
                text: qsTr("close")
                width: parent.height
                height: width
                backColor: "white"

                anchors.right: parent.right
                onClicked: {
                    numberPad.visible = false
                }
            }
        }
        Row {
            width: parent.width
            height: (parent.height - 20) / 5
            spacing: parent.spacing

            BaseButton {
                text: qsTr("7")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 7
                }
            }
            BaseButton {
                text: qsTr("8")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 8
                }
            }
            BaseButton {
                text: qsTr("9")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 9
                }
            }
        }
        Row {
            width: parent.width
            height: (parent.height - 20) / 5
            spacing: parent.spacing

            BaseButton {
                text: qsTr("4")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 4
                }
            }
            BaseButton {
                text: qsTr("5")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 5
                }
            }
            BaseButton {
                text: qsTr("6")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 6
                }
            }
        }
        Row {
            width: parent.width
            height: (parent.height - 20) / 5
            spacing: parent.spacing

            BaseButton {
                text: qsTr("1")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 1
                }
            }
            BaseButton {
                text: qsTr("2")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 2
                }
            }
            BaseButton {
                text: qsTr("3")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                    numberPad.number += 3
                }
            }
        }
        Row {
            width: parent.width
            height: (parent.height - 20) / 5
            spacing: parent.spacing

            BaseButton {
                text: qsTr("×")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number /= 10
                }
            }
            BaseButton {
                text: qsTr("0")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    numberPad.number *= 10
                }
            }
            BaseButton {
                text: qsTr("√")
                width: (parent.width - 10) / 3
                height: parent.height
                backColor: "white"

                onClicked: {
                    printer.set_temperatures(heater, number)
                    numberPad.visible = false
                }
            }
        }
    }

    onNumberChanged: {
        if (number >= 350)
            number = 350
    }

    onVisibleChanged: number = 0
}
