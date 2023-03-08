import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import Qt.labs.settings 1.0
import Qt.labs.folderlistmodel 2.15

Rectangle {
    id: printFilePage
    visible: false

    width: parent.width
    height: parent.height
    color: msStyle.background

    property StackView stack: null
    property string rootPath: "file:///E:/Users/RODEO_T/Documents/mixwareScreen"

    //    ScrollView {
    //        id: printFilePageScrollView
    //        ScrollBar.vertical.policy: ScrollBar.AlwaysOff

    //        anchors.fill: parent

    //        Column {
    //            id: spcl
    //            anchors.fill: parent
    //            spacing: msSettings.spacing

    //            BaseSettingsItem {
    //                width: printFilePageScrollView.availableWidth - parent.spacing * 2
    //                settingsItemText: qsTr("Auto-close notifications")

    //                BaseSwitch {
    //                    id: autoCloseSwitch
    //                    x: parent.width - width
    //                    y: (parent.height - height) / 2
    //                    checked: msSettings.autoCloseEnabled
    //                    onCheckedChanged: {
    //                        msSettings.autoCloseEnabled = checked
    //                    }
    //                }
    //            }
    //        }
    //    }
    ListView {
        id: printFilePageScrollView
        //        anchors.fill: parent
        width: parent.width
        height: parent.height
        //        Rectangle {
        //            anchors.fill: parent
        //            opacity: 0.2
        //            color: msStyle.buttonColor3
        //        }

        FolderListModel {
            id: folderModel
            showDotAndDotDot: true
            showDirsFirst: true
            //            nameFilters: ["*.gcode"]
            folder: rootPath
            rootFolder: rootPath
        }

        Component {
            id: fileDelegate
            //            BaseSettingsItem {
            //                width: printFilePageScrollView.width
            //                height: 72

            //                settingsItemText: fileName /*+ fileAccessed*/
            //                color: "#00a875"

            //                BaseButton {
            //                    x: parent.width - width
            //                    y: (parent.height - height) / 2
            //                    width: parent.width * 0.24
            //                    height: parent.height - 2
            //                    onClicked: {
            //                        var path = folderModel.folder + "/" + fileName
            //                        if (folderModel.isFolder(folderModel.indexOf(path))) {
            //                            if (fileName === "..")
            //                                folderModel.folder = folderModel.parentFolder
            //                            else
            //                                folderModel.folder = path
            //                        }
            //                        else {
            //                            console.log(path)
            //                        }
            //                    }
            //                }

            //                Component.onCompleted: if (fileName === ".") height = -1
            //            }
            Button {
                width: printFilePageScrollView.width
                height: 72

                flat: true

                property string path: folderModel.folder + "/" + fileName

                background: Rectangle {
                    anchors.fill: parent
                    color: "#ffa950"

                    Row {
                        anchors.fill: parent
                        spacing: 10
                        Image {
                            width: parent.height
                            height: width
                            source: {
                                if (folderModel.isFolder(folderModel.indexOf(path))) {
                                    // Is folder, show folder image
                                    return "../resource/image/logo.png"
                                }
                                else {
                                    // Is gcode file, show preview image or file image
                                    if (1) {
                                        // had preview image
                                        return "../resource/image/logo.png"
                                    }
                                    else
                                        return "../resource/image/logo.png"
                                }
                            }
                        }
                        Column {
                            width: parent.width - parent.height
                            height: parent.height
                            BaseLabel {
                                // file name
                                height: parent.height / 3
                                text: fileName
                            }
                            BaseLabel {
                                // file accessed time
                                height: parent.height / 3
                                text: fileAccessed
                            }
                            BaseLabel {
                                // file size
                                height: parent.height / 3
                                text: fileSize
                            }
                        }
                    }

                    // bottom line
                    Rectangle {
                        x: msSettings.spacing
                        height: 1
                        width: parent.width - msSettings.spacing * 2
                        color: Qt.darker(parent.color)

                        anchors.bottom: parent.bottom
                    }
                }

                onClicked: {
                    if (folderModel.isFolder(folderModel.indexOf(path))) {
                        // file is folder
                        if (fileName === "..") {
                            // go to parent folder
                            folderModel.folder = folderModel.parentFolder
                        }
                        else {
                            // go to select folder
                            folderModel.folder = path
                        }
                    }
                    else {
                        // print
                        console.log("print", path)
                        confirm.open()
                    }
                }
                Component.onCompleted: if (fileName === ".") height = -1
                Popup {
                    id: confirm
                    modal: true
                    anchors.centerIn: Overlay.overlay

                    width: printFilePage.width * 0.7
                    height: printFilePage.height * 0.5

                    closePolicy: Popup.NoAutoClose
                    spacing: msSettings.spacing

                    background: Rectangle {
                        radius: msSettings.radius
                    }

                    Image {
                        id: gcodeImage
                        visible: true
                        width: parent.width
                        height: parent.height / 2
                        fillMode: Image.PreserveAspectFit
                        source: "../resource/image/logo.png"
                    }
                    BaseLabel {
                        text: "print" + fileName + "?"

                        x: (parent.width - width) / 2
                        y: gcodeImage.visible ? gcodeImage.height + msSettings.spacing : (parent.height - height) / 2
                    }
                    BaseButton {
                        text: qsTr("ok")
                        width: 84
                        height: 48
                        backColor : msStyle.buttonColor1

                        x: parent.width - width
                        y: parent.height - height

                        onClicked: {
                            confirm.close()
                            console.log("print")
                            printingPage.visible = true;
                            printingPage.stack = stack;
                            stack.push(printingPage, StackView.Immediate)
                        }
                    }
                    BaseButton {
                        text: qsTr("canle")
                        width: 84
                        height: 48
                        backColor : msStyle.buttonColor2

                        x: parent.width - width * 2 - msSettings.spacing
                        y: parent.height - height

                        onClicked: {
                            confirm.close()
                            console.log("canle")
                        }
                    }
                }
            }
        }

        model: folderModel
        delegate: fileDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
    }

    PrintingPage {
        id: printingPage
        width: parent.width
        height: parent.height
    }

    onVisibleChanged: {
        if (folderModel.folder != rootPath)
            folderModel.folder = rootPath
    }
}
