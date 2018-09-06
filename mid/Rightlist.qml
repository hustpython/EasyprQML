import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQml.Models 2.1
import "../button" as Btn

Flickable {
    width: 200*widthbili; height: 200*heightbili
    contentWidth:0
    contentHeight:200*heightbili

    MouseArea
    {
        anchors.fill: parent
    }

    ListView
    {
        id:showplates
        width: 200*widthbili; height: 200*heightbili
        model: Platedelegate
        {
        }
        delegate: Btn.Basegrid{}
    }

}
