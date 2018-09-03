import QtQuick 2.0

Flickable {
    width: 200; height: 200
    contentWidth:mainRoot.width
    contentHeight:mainRoot.height
    Rectangle
    {
        width: 130*widthbili
        height: 100*heightbili
        radius: 3
        color: "#c0ebd7"
        Text {
            color: "red"
            font.pixelSize: 15*widthbili
            id: licenseshow
            text: qsTr("京F.A5888")
        }
    }
    MouseArea
    {
        anchors.fill: parent
    }

}
