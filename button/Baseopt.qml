import QtQuick 2.9
import QtQuick.Controls 2.3
Item {
    property string labelstr: "打开文件夹"
    signal buttonClicked
    id:baseopt

    Rectangle
    {
        id:borderarea
        radius: 5
        border.color: "black"
        opacity: 0.2
        color : "#c0ebd7"
        width: 87*widthbili
        height: 40*heightbili
        MouseArea
        {
            anchors.fill:parent
            hoverEnabled: true
            onClicked:
            {
                baseopt.buttonClicked()

            }
            onEntered:
            {
               borderarea.border.color="white"
            }
            onExited:
            {
              borderarea.border.color="black"
            }
         }
    }

     Text {
         color: "white"
         id: label
         text: qsTr(labelstr)
         font.pixelSize:14*widthbili
         anchors.horizontalCenter: borderarea.horizontalCenter
         anchors.verticalCenter: borderarea.verticalCenter
     }

}
