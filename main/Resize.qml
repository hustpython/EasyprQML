import QtQuick 2.0

import QtQuick.Window 2.2
Item {
    property int enableSize: 4
    property bool isPressed: false
    property point customPoint
    property Window mainWindow

    function positionChange(newPosition, directX/*x轴方向*/, directY/*y轴方向*/) {
        if(!isPressed) return
        var delta = Qt.point(newPosition.x-customPoint.x, newPosition.y-customPoint.y)
        //防止没有设置最小值  导致出问题
        var minimumWidth = mainWindow.minimumWidth
        var minimumHeight = mainWindow.minimumHeight
        if(minimumWidth < 9)
            minimumWidth = 9
        if(minimumHeight < 9)
            minimumHeight = 9
        var tmpW,tmpH
        if(directX >= 0)
            tmpW = mainWindow.width + delta.x
        else
            tmpW = mainWindow.width - delta.x
        if(directY >= 0)
            tmpH = mainWindow.height + delta.y
        else
            tmpH = mainWindow.height - delta.y
        if(tmpW < minimumWidth) {
            if(directX < 0)
                mainWindow.x += (mainWindow.width - minimumWidth)
            mainWindow.width = minimumWidth
        }
        else {
            mainWindow.width = tmpW
            if(directX < 0)
                mainWindow.x += delta.x
        }
        if(tmpH < minimumHeight) {
            if(directY < 0)
                mainWindow.y += (mainWindow.height - minimumHeight)
            mainWindow.height = minimumHeight
        }
        else {
            mainWindow.height = tmpH
            if(directY < 0)
                mainWindow.y += delta.y
        }
    }
}
