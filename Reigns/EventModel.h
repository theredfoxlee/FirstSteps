#ifndef EVENTMODEL_H
#define EVENTMODEL_H

#include <QObject>
#include "Event.h"

class Inspector;

class EventModel : public QObject
{
    Q_OBJECT
    friend class Inspector;

private:
    Q_PROPERTY(QString message READ message NOTIFY messageChanged)
    Q_PROPERTY(QString avatarUrl READ avatarUrl NOTIFY avatarUrlChanged)
    Q_PROPERTY(QString character READ character NOTIFY characterChanged)

    Event _event;

public:
    explicit EventModel(QObject *parent = 0);
    EventModel(Event event);

    QString message() const { return _event.message; }
    QString avatarUrl() const { return _event.avatarUrl; }
    QString character() const { return _event.character; }

signals:
    void messageChanged();
    void avatarUrlChanged();
    void characterChanged();

private:
    void synchronize();
};

#endif // EVENTMODEL_H
