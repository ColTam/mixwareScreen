
import QtQuick 2.9
import QtQuick.Controls 2.5

Rectangle {
    color: "#051f58"
    radius: 8

    Button {
        text: "登录页面-登录按钮"
        anchors.centerIn: parent
        onClicked: myLoader.sourceComponent = mainPage // 切换显示主页面
    }
}
