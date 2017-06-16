import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    property alias gameViewTop: gameViewTop
    property alias gameViewMid: gameViewMid
    property alias gameViewBot: gameViewBot

    width: 320
    height: 660

    GameViewTop {
        id: gameViewTop
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
    }

    GameViewMid {
        id: gameViewMid
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 120
        anchors.top: gameViewTop.bottom
        anchors.topMargin: 0
    }

    GameViewBot{
        id: gameViewBot
        anchors.top: gameViewMid.bottom
        anchors.topMargin: 0
    }
}
