import QtQuick 2.3

Component
{
    Item
    {
        property string toolurl: "qrc:/ico/tool1.svg"
        width: 87*widthbili
        height: 30*heightbili
    Rectangle
    {
        radius: 3
        opacity: 0.1
        smooth : true
        id:rec
        color: "#c0ebd7"
        width: 87*widthbili
        height: 35*heightbili
        MouseArea
        {
            anchors.fill:parent
            hoverEnabled: true
            onEntered:
            {
                toolurl = "qrc:/ico/tool2.svg"
                toolico.opacity=1

                rotationAnimation.start()

                rotationAnimation.start()
                rec.opacity = 1
                rec.border.color="#f0fcff"
                rec.border.width = 2
                textshow.color = "purple"
                textshow.font.underline = true
            }
            onExited:
            {
                toolurl = "qrc:/ico/tool1.svg"
                rotationAnimation.stop()
                toolico.opacity=0.7
                rec.opacity = 0.1
                rec.border.width=0
                textshow.color = "white"
                textshow.font.underline = false
            }

            onClicked:
            {
                //textshow.text = "Programming"
            }
        }
    }
Image {
    id:toolico
    opacity:0.7
    anchors.left: rec.left
    anchors.leftMargin: 4*widthbili
    anchors.verticalCenter: rec.verticalCenter
    height: 25*heightbili
    width: 25*widthbili
    source: toolurl
}
RotationAnimation{
        id:rotationAnimation
        //alwaysRunToEnd: true

        target: toolico
        from:0
        to:180
        direction: RotationAnimation.Clockwise
        duration: 300
}
Text
{
    color: "white"
    id:textshow
    anchors.verticalCenter: rec.verticalCenter
    anchors.left: toolico.right
    anchors.leftMargin: 5*widthbili
    text:textField
    font.pixelSize: 12*widthbili
}
}
}





