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
        Item
        {
            height: 10*widthbili
            width: 80*heightbili
        }

        Btn.Basegrid
        {
            width: 80*widthbili
            height: 50*heightbili
        }

    }



}
