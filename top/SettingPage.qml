import QtQuick 2.0

Item {
    id:settingpage
    width: 200
    height: 100
    visible: false
    Rectangle
    {
        color:"black"
        opacity:0.4
        radius: 10
        width:settingpage.width
        height: settingpage.height
        Text {
            id: settext
            text: qsTr("在这里设置")
        }
    }

}
