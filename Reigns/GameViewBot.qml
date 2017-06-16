import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    property alias txtPlayer: textPlayer.text
    property alias txtInPower: textInPower.text
    property alias txtYear: textYear.text

    width: 320
    height: 120
    color: "#403837"

    RowLayout {
        x: 16
        y: 11
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        ColumnLayout {

            Text {
                id: textPlayer
                color: "#f7f4bf"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 41
                Layout.preferredWidth: 179
                font.pixelSize: 18
            }

            Text {
                id: textInPower
                color: "#f7f4bf"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                Layout.preferredHeight: 41
                Layout.preferredWidth: 178
                font.pixelSize: 15
            }
        }

        ColumnLayout {

            Text {
                color: "#f7f4bf"
                text: qsTr("YEAR")
                renderType: Text.NativeRendering
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                Layout.rowSpan: 2
                Layout.preferredHeight: 41
                Layout.preferredWidth: 108
                font.pixelSize: 12
            }

            Text {
                id: textYear
                color: "#f7f4bf"
                font.weight: Font.Normal
                Layout.preferredWidth: 108
                renderType: Text.NativeRendering
                Layout.rowSpan: 2
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredHeight: 41
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }
        }
    }

}

