import QtQuick 2.7
import QtQuick.Layouts 1.0

Rectangle {
    property alias imgClergy: imageClergy.source
    property alias imgArmy: imageArmy.source
    property alias imgHealth: imageHealth.source
    property alias imgWealth: imageWealth.source
    property alias txtClergy: textClergy.text
    property alias txtArmy: textArmy.text
    property alias txtHealth: textHealth.text
    property alias txtWealth: textWealth.text

    width: 320
    height: 120
    color: "#403837"

    GridLayout {
        id: gridStatus
        x: 17
        y: 12
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        columnSpacing: 0
        rowSpacing: 8
        rows: 2
        columns: 4

        Image {
            id: imageClergy
            fillMode: Image.PreserveAspectFit
            mipmap: true
            Layout.preferredHeight: 75
            Layout.preferredWidth: 75
        }

        Image {
            id: imageArmy
            fillMode: Image.PreserveAspectFit
            mipmap: true
            Layout.preferredHeight: 75
            Layout.preferredWidth: 75
        }

        Image {
            id: imageHealth
            fillMode: Image.PreserveAspectFit
            mipmap: true
            Layout.preferredHeight: 75
            Layout.preferredWidth: 75
        }

        Image {
            id: imageWealth
            antialiasing: false
            fillMode: Image.PreserveAspectFit
            mipmap: true
            Layout.preferredHeight: 75
            Layout.preferredWidth: 75
        }

        Text {
            id: textClergy
            color: "#f7f4bf"
            font.bold: true
            wrapMode: Text.WrapAnywhere
            textFormat: Text.AutoText
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredHeight: 14
            Layout.preferredWidth: 75
            font.pixelSize: 15
        }

        Text {
            id: textArmy
            color: "#f7f4bf"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredHeight: 14
            Layout.preferredWidth: 75
            font.pixelSize: 15
        }

        Text {
            id: textHealth
            color: "#f7f4bf"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredHeight: 14
            Layout.preferredWidth: 75
            font.pixelSize: 15
        }

        Text {
            id: textWealth
            color: "#f7f4bf"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredHeight: 14
            Layout.preferredWidth: 75
            font.pixelSize: 15
        }
    }
}
