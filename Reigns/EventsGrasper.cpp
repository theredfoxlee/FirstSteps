#include "EventsGrasper.h"
#include <QFile>
#include <QTextStream>

EventsGrasper::EventsGrasper(const QString &location)
{
    _location = location;
    _imageLocation = QMap<QString, QString> {
        {"The Diplomat", "qrc:/images/images/diplomat.png"},
        {"The General", "qrc:/images/images/general.png"},
        {"The Merchant", "qrc:/images/images/merchant.png"},
        {"The Farmer", "qrc:/images/images/farmer.png"},
        {"error", "qrc:/images/images/error.png"}
    };
    _error = Event {
            QString("Wystąpił błąd podczas otwierania pliku\n %1").arg(_location),
            _imageLocation["error"],
            "error",
            Event::Influence(-1000, -1000, -1000, -1000),
            Event::Influence(-1000, -1000, -1000, -1000)
    };

    loadFromFile();
}

QVector<Event> EventsGrasper::extract() const
{
    return _events.empty() ? QVector<Event>{_error} : _events;
}

void EventsGrasper::loadFromFile()
{
    QFile file(_location);

    if (!file.open(QFile::ReadOnly | QFile::Text))
        return;

    QTextStream in(&file);

    while (!in.atEnd())
        readEvent(in);

    file.close();
}

void EventsGrasper::readEvent(QTextStream &in)
{
    // Temporary object
    Event event;
    // 1.Message
    event.message = in.readLine();
    // 2. Influence (yes & no)
    in >> event.yes.clergy >> event.yes.army >> event.yes.health >> event.yes.wealth;
    in >> event.no.clergy >> event.no.army >> event.no.health >> event.no.wealth;
    // End of line character
    QChar eof;
    in >> eof;
    // 3. Charcter name
    event.character = in.readLine();
    // 4. Character avatar Url
    event.avatarUrl = _imageLocation[event.character];
    // End of line character
    in >> eof;
    // Finalize operation
    _events.push_back(event);
}
