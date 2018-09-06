import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Window 2.2
import "../top/" as Top
import "../mid" as Mid
Window {
    opacity:1
    id :mainRoot
    visible: true
    modality: Qt.ApplicationModal;//Qt.WindowModal;
    property real mouseXTMP: 0
    property real mouseYTMP: 0
    property string buttomstring: "版本:1.0"
    property string buttomplates: ""


    width: Screen.desktopAvailableWidth*0.6
    height: Screen.desktopAvailableHeight*0.6
    property real widthbili: width / Screen.desktopAvailableWidth
    property real heightbili: height / Screen.desktopAvailableHeight
    color: "black"
    flags:Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint     //添加了这一句
    Image {
        smooth: true
        opacity:0.6
        visible: true
        id: background
        width: mainRoot.width
        height: mainRoot.height
        source: "qrc:/ico/background.jpg"
    }

    MouseArea {
           anchors.fill: parent
           onPressed: {
               mouseXTMP = mouseX
               mouseYTMP = mouseY
           }
           onPositionChanged: {
               mainRoot.x = mouseX + mainRoot.x - mouseXTMP
               mainRoot.y = mouseY + mainRoot.y - mouseYTMP
           }
           onDoubleClicked:
           {
               if (mainRoot.visibility ==Window.Maximized)
               {
                   mainRoot.visibility = Window.Windowed
                   console.log("恢复")

               }
               else{
                   mainRoot.visibility = Window.Maximized
                   console.log("最大化")
               }


           }

       }
    Column
    {
    spacing: 2*heightbili  //相邻项的间隔
    //anchors.horizontalCenter: parent.horizontalCenter
    Top.Top
    {
        id:topmenu
        width:mainRoot.width*widthbili;
        height: 10*heightbili
    }
    Item
    {
        width: 40*widthbili; height: 30*heightbili
    }

    Mid.Leftopt
    {
        width: 40*widthbili; height: mainRoot.height - 65 * heightbili
    }

    Top.Buttombar
    {
        statusstring:buttomstring+buttomplates
        width: mainRoot.width
        height: 30*heightbili
    }

    }
}

