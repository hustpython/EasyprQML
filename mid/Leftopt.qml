import QtQuick.Dialogs 1.0
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQml.Models 2.1
import "../button" as Btn
Item
{
    //anchors.left: mainRoot.left
    //anchors.leftMargin: 10
    property string getstring: ""
Row{
    spacing: 0
    Column
    {
        id:leftopt
        spacing: 15*heightbili
        FileDialog
        {
        id:fds
        title: "选择文件"
        folder: shortcuts.desktop
        selectExisting: true
        selectFolder: false
        selectMultiple: false
        nameFilters: ["图片 (*.jpg|*.jpeg|*.png|*.svg)"]
        onAccepted: {
            imgshow.imgborderopa = 1.0
            getstring = fds.fileUrl;
            showimgurl.text =  qsTr("You Choose:"+getstring)
            console.log("You chose: " + fds.fileUrl)
        }
        onRejected: {
            if(getstring == "")
            imgshow.imgborderopa = 0.5
        }

        }
        Btn.Baseopt
        {
            labelstr: "打开车牌图"
            width: 40*widthbili; height: 40*heightbili
            onButtonClicked:
            {
                fds.open()
            }
            Action
            {
                id: openAction

                shortcut: "Ctrl+O"

                onTriggered:
                {
                    fds.open()
                }
            }
        }

        Btn.Baseopt
        {
            width: 40*widthbili; height: 40*heightbili
        }
        Btn.Baseopt
        {
            labelstr: "开启摄像头"
            width: 40*widthbili; height: 40*heightbili
        }
        Btn.Baseopt
        {
            labelstr: "新车牌识别 "
            width: 40*widthbili; height: 40*heightbili
        }
        Item
        {
             width: 90*widthbili
             height: 30*heightbili
        }

        ListView
        {
            spacing: 20*heightbili
            width: 90*widthbili
            height: 150
            //anchors.fill: parent
            model: Listdelegate
            {
            }
            delegate: Reslistview{}
        }

    }
    Item {
        width: 10*widthbili
        height: 20*heightbili
    }
    Column
    {
        spacing: 0
    Text {
        id:showimgurl
        font.pixelSize: 12*widthbili
        color: "white"
        width: 100*widthbili
        height: 10*heightbili
        text: qsTr("图片显示区域")
    }
    Item
    {
       width: 100*widthbili
       height: 9*heightbili
    }

    Showimage
    {
    //anchors.left: leftopt.right
    //anchors.leftMargin: 0
    id:imgshow
    imgurl: getstring
    width: mainRoot.width - 350*widthbili;
    height: 100*heightbili
    onDoubleClicked:
    {
       fds.open()
    }
    }

    }
    Item
    {
        height: 100
        width: 10*widthbili
    }

    Rightlist
    {
        width: 120*widthbili
        height: 100*heightbili
    }
}
}
