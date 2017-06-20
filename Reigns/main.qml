import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true

    width: 320
    height: 660
    flags: Qt.FramelessWindowHint

    Dragger {
        anchors.fill: parent

        StartView {
            id: startView
            visible: true

            play.onClicked: {
                player.playerName = startView.textInputName;
                player.nickname = startView.textInputNickname;
                startView.visible = false;
                gameView.visible = true;
            }
            exit.onClicked: {
                Qt.quit();
            }
            onVisibleChanged: {
                textInputName = "John";
                textInputNickname = "the Brave";
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
            txtPlayer: player.playerName + " " + player.nickname
            txtYear: player.reignTime + " in power" + "   Year: " + player.year

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
            onVisibleChanged: {
                txtCauseOfFailure = inspector.getOverMessage();
            }
        }
    }
}
