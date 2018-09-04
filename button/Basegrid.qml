import QtQuick 2.9

Grid {
    columns: 2
    rows:2
    spacing: 15*widthbili

    property real gridwidth: 60*widthbili
    property real gridheight: 40*heightbili
    property real gridfontsize: 18*widthbili
    property string colorstr: "blue"
    property string licensechar: ""
    //horizontalItemAlignment:Grid.AlignHCenter
    //verticalItemAlignment:Grid.AlignVCenter

    Rectangle {
              opacity:0.7;color: colorstr;
              width: 40*widthbili;
              height: 40*heightbili }
    Text {
        id: licenseplate
        color: "red"
        text: qsTr(licensechar)
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize+2
    }
    Text
    {
        id: preciselabel
        color: "#F3F7F3"
        text: qsTr("准确率:")
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize
    }

    Text
    {
        id: precisevalue
        text: qsTr("90.2%")
        color:"#F6F0F4"
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize
    }
}
