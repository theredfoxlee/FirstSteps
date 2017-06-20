#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>

#include "EventsGrasper.h"
#include "RealmModel.h"
#include "EventModel.h"
#include "PlayerModel.h"
#include "Inspector.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    EventsGrasper events(":/txt/events.txt");

    Player testPlayer("John", "the Brave");
    Realm testRealm(100, 50, 50, 40);
    Event testEvent = events.extract().front();

    QScopedPointer <RealmModel> realm(new RealmModel(testRealm));
    QScopedPointer <EventModel> event(new EventModel(testEvent));
    QScopedPointer <PlayerModel> player(new PlayerModel(testPlayer));

    QScopedPointer <Inspector> inspector(new Inspector);
    inspector->setRealmModel(realm.data());
    inspector->setEventModel(event.data());
    inspector->setPlayerModel(player.data());

    inspector->setEvents(events.extract());

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("realm", realm.data());
    engine.rootContext()->setContextProperty("event", event.data());
    engine.rootContext()->setContextProperty("player", player.data());
    engine.rootContext()->setContextProperty("inspector", inspector.data());

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}
