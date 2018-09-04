import QtQuick 2.1
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "../button/" as Btn

Item
{
    id:toprow
    FontLoader { id: localFont; source: "qrc:/fonts/迷你简瘦金书.ttf" }

    Rectangle {
        id: idrec
        color: "#3FE295"
        opacity:0.8
        width:mainRoot.width; height: 20
    }
    Image
    {
        id:logo
        opacity:0.8
        width: 30; height: 30
        source: "qrc:/ico/license-plate.svg"
        anchors.top: idrec.top
        anchors.topMargin: 2
        anchors.left: idrec.left
        anchors.leftMargin: 3
    }
    Text
    {
        id:textId
        anchors.left: logo.right
        opacity:1

        font.family: localFont.name
        color: "white"
        text: "EasyPr  [车牌识别系统]"
        font.pixelSize:13
        anchors.top: idrec.top
        anchors.topMargin: 3
        anchors.leftMargin: 10

    }
    Btn.Basebtn
    {
        id: closebtn
        anchors.right: idrec.right
        anchors.top: idrec.top
        anchors.topMargin:5
        anchors.rightMargin: 15
        onButtonClicked: Qt.quit()
    }
    Btn.Basebtn
    {
        id: maxbtn
        anchors.right: closebtn.right
        anchors.top: idrec.top
        anchors.topMargin:5
        anchors.rightMargin: 24
        btnurl:"qrc:/ico/rounded-rectangle.svg"
        onButtonClicked:
        {
            if (mainRoot.visibility ==Window.Maximized)
            {
                mainRoot.visibility = Window.AutomaticVisibility
                console.log("恢复")
            }
            else{
                mainRoot.visibility = Window.Maximized
                console.log("最大化")
            }

        }
    }
    Btn.Basebtn
    {
        id: minbtn
        anchors.right: maxbtn.right
        anchors.top: idrec.top
        anchors.topMargin:5
        anchors.rightMargin: 24
        btnurl:"qrc:/ico/substract.svg"
        onButtonClicked:
        {
            if (mainRoot.visibility !=Window.Minimized)
            {
                mainRoot.visibility = Window.Minimized
                console.log("最小化")
            }
        }
    }
    Btn.Basebtn
    {
        id: setbtn
        anchors.right: minbtn.right
        anchors.top: idrec.top
        anchors.topMargin:5
        anchors.rightMargin: 30
        btnurl:"qrc:/ico/settings.svg"

        Pop
        {
            id:settingpop
            width: 200
            height: 150
            x:-(mainRoot.width - width)/2 - (mainRoot.width - setbtn.x)
            y:(mainRoot.height-height)/2
        }
        SettingPage
        {
            id:settingpage
            width: 200
            height: 150
            x:-(mainRoot.width - width)/2 - (mainRoot.width - setbtn.x)
            y:(mainRoot.height-height)/2
        }

        onButtonClicked:
        {
            //settingpage.visible=!settingpage.visible
            settingpop.open()
        }


   }
}
