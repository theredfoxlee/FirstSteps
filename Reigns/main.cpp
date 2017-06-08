#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlEngine>
#include <QQmlContext>

#include <QVector>
#include <QFile>
#include <QTextStream>
#include <QDebug>

#include "Data.h"
#include "Event.h"
#include "Player.h"
#include "Realm.h"
#include "Controller.h"

QVector <Event> getEvents(const QString & eventsUrl);

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Data data(Player("John", "the Brave"), Realm());
    QScopedPointer<Controller> controller(new Controller(data, getEvents(":/txt/events.txt")));

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("controller", controller.data());
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    return app.exec();
}

QVector <Event> getEvents(const QString & eventsUrl)
{
    QFile file("C:/Users/John/Desktop/Reigns/Reigns/events.txt");

    qDebug() << eventsUrl;


    if (!file.open(QFile::ReadOnly | QFile::Text))
    {
        QVector <Event> temp;
        QString message("Eventy nie załadowane.");
        Event::Influence yes(0, 0, 0, 0);
        Event::Influence no(0, 0, 0, 0);
        temp.push_back(Event(message, "qrc:/images/images/helmet.png", "Some Charater The First", yes, no));
        return temp;
    }

    QTextStream in(&file);
    QVector <Event> temp;

    while (!in.atEnd())
    {
        Event event;
        char endOfLine;

        event.message = in.readLine();
        in >> event.yes.clergy >> event.yes.army >> event.yes.health >> event.yes.wealth;
        in >> event.no.clergy >> event.no.army >> event.no.health >> event.no.wealth;

        in >> endOfLine;
        event.avatarUrl = "qrc:/images/images/helmet.png";
        event.character = in.readLine();
        in >> endOfLine;

        temp.push_back(event);
    }

    file.close();

    return temp;
}
