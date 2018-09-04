import QtQuick 2.9

Grid {
    columns: 2
    rows:2
    spacing: 15*widthbili

    property real gridwidth: 80*widthbili
    property real gridheight: 50*heightbili
    property real gridfontsize: 24*widthbili
    //horizontalItemAlignment:Grid.AlignHCenter
    //verticalItemAlignment:Grid.AlignVCenter

    Rectangle { opacity:0.7;color: "blue"; width: 40*widthbili; height: 40*heightbili }
    Text {
        id: licenseplate
        color: "red"
        text: qsTr("京 A.GH092")
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize
    }
    Text
    {
        id: preciselabel
        text: qsTr("准确率:")
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize
    }

    Text
    {
        id: precisevalue
        text: qsTr("90.2%")
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize
    }
}
