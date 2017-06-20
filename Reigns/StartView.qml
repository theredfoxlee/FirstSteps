import QtQuick 2.7
import QtQuick.Layouts 1.0
import QtMultimedia 5.5

Rectangle {
    id: rectangle
    property alias play: play
    property alias exit: exit
    property alias textInputName: textInputName.text
    property alias textInputNickname: textInputNickname.text

    width: 320
    height: 660
    color: "#161616"

    Text {
        id: textGreeting
        x: 16
        width: 289
        height: 57
        color: "#ffffff"
        text: qsTr("Let's start the journey!")
        font.bold: false
        anchors.top: imageCrown.bottom
        anchors.topMargin: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24
    }

    Image {
        id: imageCrown
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 480
        anchors.right: parent.right
        anchors.rightMargin: 114
        anchors.left: parent.left
        anchors.leftMargin: 116
        fillMode: Image.PreserveAspectFit
        mipmap: true
        anchors.top: parent.top
        anchors.topMargin: 105
        source: "qrc:/images/images/crown.png"
    }

    ColumnLayout {
        anchors.top: textGreeting.bottom
        anchors.topMargin: 45
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        spacing: 15

        Rectangle {
            id: rectangleBandNo1
            color: "#fed700"
            Layout.preferredHeight: 80
            Layout.preferredWidth: 320

            TextInput {
                id: textInputName
                x: 8
                y: 16
                width: 304
                height: 48
                color: "#161616"
                text: qsTr("John")
                inputMask: qsTr("")
                selectionColor: "#161616"
                font.bold: true
                font.family: "MS Shell Dlg 2"
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 40
                selectByMouse: true
                maximumLength: 12
            }
        }

        Rectangle {
            id: rectangleBandNo2
            color: "#fed700"
            Layout.preferredHeight: 80
            Layout.preferredWidth: 320

            TextInput {
                id: textInputNickname
                x: 8
                y: 16
                width: 304
                height: 48
                color: "#161616"
                text: qsTr("the Brave")
                selectionColor: "#161616"
                font.bold: true
                font.pixelSize: 40
                horizontalAlignment: Text.AlignLeft
                selectByMouse: true
                maximumLength: 12
            }
        }
    }

    SoundEffect {
        id: kick
        source: "qrc:/sound/sound/kick.wav"
    }

    RowLayout {
        y: 593
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 27
        anchors.left: parent.left
        anchors.leftMargin: 39
        anchors.right: parent.right
        anchors.rightMargin: 181

        Text {
            id: textOptionNo1
            color: "#ffffff"
            text: qsTr("Play")
            fontSizeMode: Text.FixedSize
            Layout.preferredHeight: 40
            Layout.preferredWidth: 60
            font.pixelSize: 13
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            verticalAlignment: Text.AlignVCenter
        }

        Image {
            id: imageOptionNo1
            Layout.preferredHeight: 35
            Layout.preferredWidth: 35
            fillMode: Image.PreserveAspectFit
            mipmap: true
            source: "qrc:/images/images/play.png"
        }

        MouseArea {
            id: play
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: kick.play()
        }
    }

    RowLayout {
        y: 593
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 27
        anchors.left: parent.left
        anchors.leftMargin: 179
        anchors.right: parent.right
        anchors.rightMargin: 41

        Text {
            id: textOptionNo2
            color: "#ffffff"
            text: qsTr("Exit")
            Layout.preferredHeight: 40
            font.pixelSize: 13
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredWidth: 60
            font.bold: true
            verticalAlignment: Text.AlignVCenter
        }

        Image {
            id: imageOptionNo2
            mipmap: true
            Layout.preferredHeight: 35
            Layout.preferredWidth: 35
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/images/exit3.png"
        }

        MouseArea {
            id: exit
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: kick.play()
        }
    }


}
