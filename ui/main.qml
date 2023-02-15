import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

Window {
    id: window
    visible: true
    width: 320
    height: 540
    title: qsTr("Mixware Screen")


    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        color: "#fff8dc"

        //用于动态显示元素
        Loader{
            id:btnLoader
            width: parent.width
            height: parent.height
        }

        //切换状态
        Timer {
            interval: 5000
            running: true
            repeat: true
            onTriggered: {
                if (root.state == "disconnected")
                    root.state = "connected"
                else
                    root.state = "disconnected"
                console.log(root.state)
            }
        }

        state: "disconnected"
        states: [
            State {
                name: "disconnected"
                PropertyChanges { target: btnLoader; source: "MixwareScreen.qml"; }
            },
            State {
                name: "connected"
                PropertyChanges { target: btnLoader; source: "HomePage.qml"; }
            }
        ]
    }
}
