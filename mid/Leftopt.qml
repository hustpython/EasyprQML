import QtQuick.Dialogs 1.0
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQml.Models 2.1
import "../button" as Btn
import com.mxq.easypr 1.0
Item
{
    //anchors.left: mainRoot.left
    //anchors.leftMargin: 10
    property string getstring: ""
    Platedelegate
    {
        id:platelist
    }

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
            mainRoot.buttomplates = ""
            imgshow.imgborderopa = 1.0
            getstring = fds.fileUrl;
            mainRoot.buttomstring = getstring.substring(7,getstring.length)
            easypr.imgurl = getstring
            platelist.clear()
            var i = 0;
            var countplate = easypr.plates.length
            var platestr;
            var platecolor;
            var modelplate;
            var modelcolor;
            var modelprovince
            for(;i<countplate;i++)
            {
                platestr = easypr.plates[i]
                platecolor = platestr.substring(0,1)
                modelplate = platestr.substring(3,platestr.length)
                modelprovince = platestr.substring(3,4)
                if(platecolor == "蓝")
                {
                    modelcolor= "blue"
                }
                else
                {
                    modelcolor = "yellow"
                }

                platelist.append({"licensechar":modelplate,"colorstr":modelcolor,"province":modelprovince})

                mainRoot.buttomplates += "     "+ platestr

            }
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
             height: 20*heightbili

        Rectangle
        {
            anchors.centerIn: parent
            height:  1*heightbili;
            width:  90*widthbili
            LinearGradient {
                anchors.fill: parent
                start: Qt.point(0, 0)
                end: Qt.point(width, 0)
                gradient: Gradient {
                    GradientStop { position: 0.5; color: "lightsteelblue" }
                    GradientStop { position: 0.0; color: "#2F3D45" }
                }
            }
        }
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
        width: 5*widthbili
        height: 20*heightbili
    }
    Rectangle
    {
        width: 1*widthbili;
        height: mainRoot.height - 100*heightbili
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "#2F3D45" }
        }
    }
    Item {
        width: 4*widthbili
        height: 20*heightbili
    }
    Showimage
    {
    //anchors.left: leftopt.right
    //anchors.leftMargin: 0
    id:imgshow
    imgurl: getstring
    width:  mainRoot.width - 300*widthbili;
    height: mainRoot.height - 100*heightbili
    onDoubleClicked:
    {
       fds.open()
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
        ListView
        {
            id:showplates
            width: 200*widthbili; height: 200*heightbili
            model:platelist
            delegate: Btn.Basegrid{}
        }
    }
}
PlateLicense
{
    id:easypr
}
}
