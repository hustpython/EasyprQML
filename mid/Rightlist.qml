import QtQuick 2.0
import QtQuick.Controls 1.4
import "../button" as Btn

Flickable {
    width: 200*widthbili; height: 200*heightbili
    contentWidth:0
    contentHeight:200*heightbili

    MouseArea
    {
        anchors.fill: parent
    }

    Column
    {
        spacing: 2
        Item
        {
            height: 10*widthbili
            width: 80*heightbili
        }

        Btn.Basegrid
        {
            licensechar: "鲁A·KL315"
            width: 80*widthbili
            height: 50*heightbili
        }

        Item
        {
            height: 90*widthbili
            width: 80*heightbili
        }

        Btn.Basegrid
        {
            colorstr: "yellow"
            licensechar: "渝F.56N46"
            width: 80*widthbili
            height: 50*heightbili
        }

        Item
        {
            height: 90*widthbili
            width: 80*heightbili
        }

        Btn.Basegrid
        {
            licensechar: "京 A.GH092"
            colorstr: "blue"
            width: 80*widthbili
            height: 50*heightbili
        }

    }



}
