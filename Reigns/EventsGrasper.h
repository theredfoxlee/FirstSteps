#ifndef EVENTSGRASPER_H
#define EVENTSGRASPER_H

#include <QString>
#include <QVector>
#include <QMap>
#include "event.h"

class QTextStream;

class EventsGrasper
{
private:
    QString _location;
    QVector<Event> _events;
    QMap<QString, QString> _imageLocation;

    Event _error;
public:
    EventsGrasper(const QString &location);

    QVector<Event> extract() const;
private:
    void loadFromFile();
    void readEvent(QTextStream &in);
};

#endif // EVENTSGRASPER_H
