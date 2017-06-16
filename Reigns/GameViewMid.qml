import QtQuick 2.0
import QtMultimedia 5.5

Rectangle {
    property alias txtMessage: textMessage.text
    property alias imgAvatar: imageAvatar.source
    property alias txtCharcter: textCharacter.text
    property alias kick: kick.source
    property alias avatarInteraction: mouseAreaAvatar

    width: 320
    height: 420
    color: "#cecdcd"

    Text {
        id: textMessage
        x: 10
        y: 8
        width: 300
        height: 100
        color: "#be3e2c"
        anchors.horizontalCenter: parent.horizontalCenter
        fontSizeMode: Text.FixedSize
        elide: Text.ElideNone
        wrapMode: Text.WordWrap
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
    }


    Rectangle {
        color: "#be3e2c"
        radius: 15
        anchors.bottom: textCharacter.top
        anchors.bottomMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.left: parent.left
        anchors.leftMargin: 25
        anchors.top: textMessage.bottom
        anchors.topMargin: 6

        SoundEffect {
            id: kick
        }

        MouseArea {
            id: mouseAreaAvatar
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: kick.play()
        }

        Image {
            id: imageAvatar
            x: 90
            y: 50
            width: 210
            height: 225
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
        }
    }

    Text {
        id: textCharacter
        x: 1
        y: 386
        width: 300
        height: 26
        color: "#be3e2c"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideNone
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16
        fontSizeMode: Text.FixedSize
        wrapMode: Text.WordWrap
    }
}
