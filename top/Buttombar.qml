import QtQuick 2.0

Item {
    property string statusstring: "版本:1.0"
    Rectangle
    {
        color: "#273852"
        id:buttombar
        opacity: 0.3
        width: mainRoot.width
        height: 30*heightbili
    }
    Row
    {
    Item
    {
        width: 10
        height: 10
    }

    Text {
        id: "showstatus"
        anchors.verticalCenter: parent.verticalCenter
        opacity: 1
        font.pixelSize: 12*widthbili
        color: "white"
        text: qsTr(statusstring)
    }
    }
}
