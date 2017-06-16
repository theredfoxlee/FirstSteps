import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 320
    height: 700
    title: qsTr("Reigns")
//    flags: Qt.FramelessWindowHint

    SwipeView {
        id: swipeView
        currentIndex: tabBar.currentIndex

//        StartView {
//
//        }

        GameView {
            gameViewTop.txtClergy: realm.clergy
            gameViewTop.txtArmy: realm.army
            gameViewTop.txtHealth: realm.health
            gameViewTop.txtWealth: realm.wealth
            gameViewTop.imgClergy: "qrc:/images/images/cross.png"
            gameViewTop.imgArmy: "qrc:/images/images/axe.png"
            gameViewTop.imgHealth: "qrc:/images/images/human.png"
            gameViewTop.imgWealth: "qrc:/images/images/dollar.png"

            gameViewMid.txtMessage: event.message
            gameViewMid.txtCharcter: event.character
            gameViewMid.imgAvatar: event.avatarUrl
            gameViewMid.kick: "qrc:/sound/sound/kick.wav"
            gameViewMid.avatarInteraction {
                onClicked: {
                    inspector.update(gameViewMid.avatarInteraction.mouseX <
                                     ( gameViewMid.avatarInteraction.parent.width / 2))
                }
            }

            gameViewBot.txtPlayer: player.playerName + " " + player.nickname
            gameViewBot.txtInPower: player.reignTime + " years in power"
            gameViewBot.txtYear: player.year
        }

//        EndView {
//
//        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        contentHeight: 40

//        TabButton {
//            text: "Again"
//        }

        TabButton {
            text: "GAME"
        }

//        TabButton {
//            text: "Quit"
//        }
    }
}
