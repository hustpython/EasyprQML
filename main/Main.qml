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
    width: 480
    height: 320
    color: "black"
    flags:Qt.FramelessWindowHint || WindowStaysOnBottomHint   //添加了这一句

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
    spacing: 2  //相邻项的间隔
    //anchors.horizontalCenter: parent.horizontalCenter
    Top.Top
    {
        id:topmenu
        width:mainRoot.width;
        height: 20
    }
    Item
    {
        width: 40; height: 3
    }

    Mid.Leftopt
    {
        width: 40; height: 40
    }

    }


}

