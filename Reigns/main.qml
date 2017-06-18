import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 320
    height: 660
    title: qsTr("Reigns")
    flags: Qt.FramelessWindowHint

    MouseArea {
        anchors.fill: parent
        property variant previousPosition
        onPressed: {
            previousPosition = Qt.point(mouseX, mouseY)
        }
        onPositionChanged: {
            if (pressedButtons == Qt.LeftButton) {
                var dx = mouseX - previousPosition.x
                var dy = mouseY - previousPosition.y
                window.x += dx;
                window.y += dy;
            }
        }

        StartView {
            id: startView
            visible: true
            onVisibleChanged: {
                textInputName = "John";
                textInputNickname = "the Brave";
            }

            play.onClicked: {
                player.playerName = startView.textInputName;
                player.nickname = startView.textInputNickname;
                startView.visible = false;
                gameView.visible = true;
            }
            exit.onClicked: {
                Qt.quit();
            }
        }

        GameView {
            id: gameView
            visible: false
            txtClergy: realm.clergy
            txtArmy: realm.army
            txtHealth: realm.health
            txtWealth: realm.wealth
            txtMessage: event.message
            txtCharcter: event.character
            imgAvatar: event.avatarUrl
            yes {
                onClicked: {
                    inspector.update(true);
                    if (inspector.isOver()) {
                        gameView.visible = false;
                        endView.visible = true;
                    }
                }

            }
            no {
                onClicked: {
                    inspector.update(true);
                    if (inspector.isOver()) {
                        gameView.visible = false;
                        endView.visible = true;
                    }
                }
            }
            txtPlayer: player.playerName + " " + player.nickname
            txtYear: player.reignTime + " in power" + "   Year: " + player.year
            surrender {
                onClicked: {
                    inspector.surrender = true;
                    gameView.visible = false;
                    endView.visible = true;
                }
            }
        }

        EndView {
            id: endView
            visible: false

            onVisibleChanged: {
                txtCauseOfFailure = inspector.getOverMessage();
            }

            txtCauseOfFailure: inspector.getOverMessage()
            txtAchievement: "You have survievd " + player.reignTime + " years!"
            again {
                onClicked: {
                    inspector.reset();
                    endView.visible = false;
                    startView.visible = true;
                }
            }
            exit {
                onClicked: Qt.quit()
            }
        }
    }
}
