import QtQuick 2.7
import QtQuick.Layouts 1.0
import QtMultimedia 5.5

Rectangle {
    property alias txtClergy: textClergy.text
    property alias txtArmy: textArmy.text
    property alias txtHealth: textHealth.text
    property alias txtWealth: textWealth.text
    property alias txtMessage: textMessage.text
    property alias imgAvatar: imageAvatar.source
    property alias txtCharcter: textCharacterName.text
    property alias yes: mouseAreaYes
    property alias no: mouseAreaNo
    property alias txtPlayer: textPlayerName.text
    property alias txtYear: textYear.text
    property alias surrender: mouseAreaSrurrender

    width: 320
    height: 660
    color: "#161616"

    GridLayout {
        x: 13
        y: 25
        rows: 2
        columns: 4

        Image {
            id: imageClergy
            Layout.preferredHeight: 84
            Layout.preferredWidth: 70
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/images/cross[white].png"
            mipmap: true
        }

        Image {
            id: imageArmy
            Layout.preferredHeight: 84
            Layout.preferredWidth: 70
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/images/axe[white].png"
            mipmap: true
        }

        Image {
            id: imageHealth
            Layout.preferredHeight: 84
            Layout.preferredWidth: 70
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/images/human[white].png"
            mipmap: true
        }

        Image {
            id: imageWealth
            Layout.preferredHeight: 84
            Layout.preferredWidth: 70
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/images/dollar[white].png"
            mipmap: true
        }

        Text {
            id: textClergy
            color: "#ffffff"
            text: qsTr("Text")
            Layout.preferredHeight: 18
            Layout.preferredWidth: 70
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }

        Text {
            id: textArmy
            color: "#ffffff"
            text: qsTr("Text")
            Layout.preferredHeight: 18
            Layout.preferredWidth: 70
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: textHealth
            color: "#ffffff"
            text: qsTr("Text")
            Layout.preferredHeight: 18
            Layout.preferredWidth: 70
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: textWealth
            color: "#ffffff"
            text: qsTr("Text")
            Layout.preferredHeight: 18
            Layout.preferredWidth: 70
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    ColumnLayout {
        anchors.top: parent.top
        anchors.topMargin: 145
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Rectangle {
            color: "#fed700"
            Layout.preferredHeight: 82
            Layout.preferredWidth: 320

            Text {
                id: textMessage
                x: 8
                y: 8
                width: 304
                height: 66
                color: "#161616"
                text: qsTr("Text")
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }
        }

        Rectangle {
            color: "#ffffff"
            Layout.preferredHeight: 225
            Layout.preferredWidth: 320

            SoundEffect {
                id: kick
                source: "qrc:/sound/sound/kick.wav"
            }

            Image {
                id: imageAvatar
                x: 50
                y: 15
                width: 220
                height: 195
                fillMode: Image.PreserveAspectFit
                source: "qrc:/qtquickplugin/images/template_image.png"
                mipmap: true
            }

            MouseArea {
                id: mouseAreaNo
                anchors.right: parent.right
                anchors.rightMargin: 160
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                cursorShape: Qt.PointingHandCursor
                onClicked: kick.play()
            }

            MouseArea {
                id: mouseAreaYes
                anchors.left: parent.left
                anchors.leftMargin: 160
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                cursorShape: Qt.PointingHandCursor
                onClicked: kick.play()
            }
        }

        Rectangle {
            color: "#fed700"
            Layout.preferredHeight: 45
            Layout.preferredWidth: 320
            Text {
                id: textCharacterName
                x: 93
                y: 7
                width: 134
                height: 31
                color: "#161616"
                text: qsTr("Text")
                font.bold: true
                wrapMode: Text.WrapAnywhere
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Text {
        id: textPlayerName
        x: 71
        y: 520
        width: 179
        height: 41
        color: "#ffffff"
        text: qsTr("Text")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 12
    }

    Text {
        id: textYear
        x: 71
        y: 567
        width: 179
        height: 41
        color: "#ffffff"
        text: qsTr("Text")
        font.bold: true
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle {
        x: 111
        y: 622
        width: 100
        height: 30
        color: "#bf3c28"

        Text {
            color: "#ffffff"
            text: qsTr("Surrender")
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea {
            id: mouseAreaSrurrender
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: kick.play()
        }
    }

}
