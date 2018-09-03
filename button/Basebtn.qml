import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

Item{
    property url btnurl: "qrc:/ico/close.svg"
    property real opacityvalue: 0.8
    property string promptname: "关闭"
    property int clickType: 0
    signal buttonClicked
    id:basebtn
    Image
    {
        id:btnico
        opacity:opacityvalue
        width: 10; height: 10
        source: btnurl
        MouseArea
        {
            anchors.fill:parent
            hoverEnabled: true
            onClicked:
            {
                basebtn.buttonClicked()

            }

            onEntered:
            {
              parent.opacity = 1
              shadowrec.opacity = 0.1
              //promplabel.visible = true
            }
            onExited: {
                parent.opacity = opacityvalue
                shadowrec.opacity = 0
                promplabel.visible = false
            }

        }

        Rectangle
        {
            radius: 3
            id:shadowrec
            width: 15; height: 15
            anchors.horizontalCenter: btnico.horizontalCenter
            anchors.verticalCenter: btnico.verticalCenter
            opacity:0
        }
    }
    Label{
        anchors.horizontalCenter: btnico.horizontalCenter
        anchors.verticalCenter: btnico.verticalCenter
        id:promplabel
        text:promptname
        visible: false
        color:                          "green"
        wrapMode:                       Text.Wrap
        verticalAlignment:              Text.AlignVCenter
        horizontalAlignment:            Text.AlignHCenter
    }
}

