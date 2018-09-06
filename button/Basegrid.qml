import QtQuick 2.9

Grid {
    columns: 2
    rows:2
    spacing: 15*widthbili

    property real gridwidth: 60*widthbili
    property real gridheight: 40*heightbili
    property real gridfontsize: 18*widthbili
    //property string colorstr: "blue"
    //property string licensechar: "京A.8888"
    //horizontalItemAlignment:Grid.AlignHCenter
    //verticalItemAlignment:Grid.AlignVCenter

    Rectangle {
              opacity:0.7;color: colorstr;
              width: 40*widthbili;
              height: 40*heightbili
              rotation:-90
              radius:2
              gradient: Gradient {
                  GradientStop { position: 0.0; color: "lightsteelblue" }
                  GradientStop { position: 0.9; color: colorstr }
              }}
    Text {
        id: licenseplate
        color: "red"
        text: licensechar
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize+2
    }
    Text
    {
        id: preciselabel
        color: "#F3F7F3"
        text: qsTr("省份:")
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize
    }

    Text
    {
        id: precisevalue
        text: province
        color:"#F6F0F4"
        width:gridwidth
        height:gridheight
        font.pixelSize: gridfontsize
    }
}

