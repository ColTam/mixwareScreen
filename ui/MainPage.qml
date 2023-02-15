
import QtQuick 2.9
import QtQuick.Controls 2.5

Rectangle {
    color: "#498ff8"
    radius: 8

    Button {
        text: "主页面-返回按钮"
        anchors.centerIn: parent
        onClicked: myLoader.sourceComponent = printPage // 切换显示登录页面
    }
}
