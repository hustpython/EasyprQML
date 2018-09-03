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
        spacing: 15
        FileDialog
        {
        id:fds
        title: "选择文件"
        folder: shortcuts.desktop
        selectExisting: true
        selectFolder: false
        selectMultiple: false
        nameFilters: ["图片 (*.jpg|*.png|*.svg)"]
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
            width: 40; height: 40
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
            width: 40; height: 40
        }
        Btn.Baseopt
        {
            labelstr: "打开摄像头"
            width: 40; height: 40
        }
        Btn.Baseopt
        {
            labelstr: "新车牌识别 "
            width: 40; height: 40
        }
        Item
        {
             width: 90
             height: 30
        }

        ListView
        {
            spacing: 20
            width: 90
            height: 150
            //anchors.fill: parent
            model: Listdelegate
            {
            }
            delegate: Reslistview{}
        }

    }
    Column
    {
        spacing: 0
    Text {
        id:showimgurl
        font.pixelSize: 9
        color: "white"
        width: 100
        height: 10
        text: qsTr("图片显示区域")
    }
    Item
    {
       width: 100
       height: 3
    }

    Showimage
    {
    //anchors.left: leftopt.right
    //anchors.leftMargin: 0
    id:imgshow
    imgurl: getstring
    width:100;
    height: 100
    onDoubleClicked:
    {
       fds.open()
    }
    }
    }
}
}
