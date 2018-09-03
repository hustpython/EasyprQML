import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    property string imgurl: ""
    property real imgborderopa: 0.5
    id:imgitem
    signal doubleClicked
    Rectangle{
        //anchors.fill: parent
        id:imgborder
        clip:true
        radius: 10
        border.color: "#770B77"
        color: "#F5F7F6"
        opacity: imgborderopa
        width: mainRoot.width - 245*widthbili
        //width:600
        //height: 600
        height: mainRoot.height - 80*heightbili
        Image {
            //anchors.fill: imgborder
            //anchors.horizontalCenter:imgborder.horizontalCenter
            //anchors.verticalCenter: imgborder.verticalCenter
            clip: true
            //anchors.centerIn: imgborder
            width: imgborder.width
            height: imgborder.height
            fillMode: Image.PreserveAspectFit
            id: pig
            //x:-hbar.position * width
            //y:-vbar.position * height
            source:imgurl

        }
    }
    Text {
        color:"#FFFFFF"
        font.pixelSize: 24*widthbili
        anchors.centerIn: imgborder
        id: showopentext
        text: qsTr("双击打开文件")
    }

    ////////
    property double scaleValue: 1.1
    property int scaleLevel: 0

        function zoomIn(x,y){
            var beforeWidth  = pig.width
            var beforeHeight = pig.height
            pig.width = pig.width   * scaleValue
            pig.height = pig.height * scaleValue

            pigMouseArea.width = pig.width
            pigMouseArea.height = pig.height
            pig.x = pig.x + x - pig.width  * x / beforeWidth
            pig.y = pig.y + y - pig.height * y / beforeHeight
            scaleLevel++
        }

        function zoomOut(x,y){
            var beforeWidth  = pig.width
            var beforeHeight = pig.height
            pig.width = pig.width   / scaleValue
            pig.height = pig.height / scaleValue
            pigMouseArea.width = pig.width
            pigMouseArea.height = pig.height
            pig.x = pig.x + x - pig.width  * x / beforeWidth
            pig.y = pig.y + y - pig.height * y / beforeHeight

            scaleLevel--
        }
    ////////

    MouseArea
    {
    id:pigMouseArea
    anchors.fill: imgborder
    drag.target: pig
    drag.axis: Drag.XAndYAxis//设置横向纵向拖动
    onWheel: {
        if(wheel.angleDelta.y>0&&scaleLevel<=10){//图像放大处理
            pig.transformOriginPoint.x = wheel.x
            pig.transformOriginPoint.y = wheel.y
            zoomIn(wheel.x,wheel.y)

         }
         else if(wheel.angleDelta.y<0&&scaleLevel>=-10){//图像缩小处理

             pig.transformOriginPoint.x = wheel.x
             pig.transformOriginPoint.y = wheel.y
             zoomOut(wheel.x,wheel.y)
         }
    }
    onDoubleClicked:
    {
        imgitem.doubleClicked()
        showopentext.text = qsTr("")

    }

   }



}
