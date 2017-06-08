import QtQuick 2.6
import QtQuick.Window 2.2
import QtMultimedia 5.5

Window {
    id: root
    visible: true
    width: 350
    height: 620
    maximumWidth: 350
    maximumHeight: 620
    minimumWidth: 350
    minimumHeight: 620

    Column {
        spacing: 0
        Rectangle {
            id: top
            width: 350
            height: 95
            color: "#403837"

            Row {
                id: status
                anchors.horizontalCenter: parent.horizontalCenter
                padding: 10
                spacing: 10

                Image {
                    id: cross
                    source: "qrc:/images/images/cross.png"
                    width: 75
                    height: 50
                    fillMode: Image.PreserveAspectFit
                    mipmap: true

                    Text {
                        id: statusChurch
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#F7F4BF"
                        font.bold:true
                        font.pixelSize: 12
                        text: controller.clergy
                    }
                }

                Image {
                    id: axe
                    source: "qrc:/images/images/axe.png"
                    width: 75
                    height: 50
                    fillMode: Image.PreserveAspectFit
                    mipmap: true

                    Text {
                        id: statusArmy
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#F7F4BF"
                        font.bold:true
                        font.pixelSize: 12
                        text: controller.army
                    }
                }

                Image {
                    id: human
                    source: "qrc:/images/images/human.png"
                    width: 75
                    height: 50
                    fillMode: Image.PreserveAspectFit
                    mipmap: true

                    Text {
                        id: statusHuman
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#F7F4BF"
                        font.bold:true
                        font.pixelSize: 12
                        text: controller.health
                    }
                }

                Image {
                    id: dollar
                    source: "qrc:/images/images/dollar.png"
                    width: 75
                    height: 50
                    fillMode: Image.PreserveAspectFit
                    mipmap: true

                    Text {
                        id: statusMoney
                        anchors.top: parent.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#F7F4BF"
                        font.bold:true
                        font.pixelSize: 12
                        text: controller.wealth
                    }
                }
            }
        }

        Rectangle {
            id: mid
            width: 350
            height: 430
            color: "#cecdcd"

            SoundEffect {
                id: kick
                source: "qrc:/sound/sound/kick.wav"
            }

            Column {
                width: 350
                spacing: 10

                Text {
                    id: event
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    width: 270
                    height: 100
                    color: "#BE3E2C"
                    wrapMode: Text.WordWrap
                    //text: qsTr("A group of people have become enraged and are now hunting witches. Are we allowed to kill if necessary?")
                    text: controller.message
                    font.pixelSize: 14
                }

                Rectangle {
                    id: setting
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 270
                    height: 270
                    color: "#BE3E2C"
                    radius: 15

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            kick.play()
                            controller.update(mouseX < (parent.width / 2))
                        }
                    }

                    /*Rectangle {
                        id: refuse
                        width: 135
                        height: 270
                        color: "transparent"
                        radius: 15

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                parent.color = "#fff"
                            }
                            onExited: {
                                parent.color = "transparent"
                            }
                        }
                    }

                    Rectangle {
                        id: accept
                        anchors.left: refuse.right
                        width: 135
                        height: 270
                        color: "transparent"
                        radius: 15

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                parent.color = "#00"
                            }
                            onExited: {
                                parent.color = "transparent"
                            }
                        }
                    }*/

                    Image {
                        id: avatar
                        anchors.centerIn: parent
                        width: 210
                        height: 225
                        //source: "qrc:/images/images/helmet.png"
                        source: controller.avatarUrl
                        fillMode: Image.PreserveAspectFit
                        mipmap: true
                    }
                }

                Text {
                    id: characterName
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    height: 20
                    color: "#BE3E2C"
                    wrapMode: Text.WordWrap
                    //text: qsTr("General Arnoulf of Dover")
                    text: controller.character
                    font.pixelSize: 16
                    font.bold: true
                }
            }
        }

        Rectangle {
            id: bot
            width: 350
            height: 95
            color: "#403837"

            Text {
                id: playerName
                anchors.top: bot.top
                anchors.left: bot.left
                anchors.leftMargin: 20
                anchors.topMargin: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                height: 20
                color: "#F7F4BF"
                wrapMode: Text.WordWrap
                //text: qsTr("King John the Brave")
                text: controller.playerName + controller.nickname
                font.pixelSize: 18
                font.bold: true
            }

            Text {
                id: reignTime
                anchors.top: playerName.bottom
                anchors.left: bot.left
                anchors.leftMargin: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                height: 20
                color: "#F7F4BF"
                wrapMode: Text.WordWrap
                //text: qsTr("0 years in power")
                text: controller.reignTime + " years in power"
                font.pixelSize: 14
            }

            Text {
                id: yearLabel
                anchors.top: bot.top
                anchors.right: bot.right
                anchors.rightMargin: 20
                anchors.topMargin: 25
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                height: 20
                color: "#F7F4BF"
                wrapMode: Text.WordWrap
                text: qsTr("Year")
                font.pixelSize: 14
            }

            Text {
                id: year
                anchors.top: yearLabel.bottom
                anchors.right: bot.right
                anchors.rightMargin: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                height: 20
                color: "#F7F4BF"
                wrapMode: Text.WordWrap
                //text: qsTr("664")
                text: controller.year
                font.pixelSize: 14
            }
        }
    }
}
