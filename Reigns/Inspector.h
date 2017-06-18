#ifndef INSPECTOR_H
#define INSPECTOR_H

#include <QObject>
#include <QVector>
#include "Event.h"
#include "RealmModel.h"
#include "EventModel.h"
#include "PlayerModel.h"

class Inspector : public QObject
{
    Q_OBJECT

private:
    RealmModel * _realm;
    EventModel * _event;
    PlayerModel * _player;

    QVector <Event> _events;

    const int _EVENTS_PER_YEAR = 4;
    int _events_counter = 0;
public:
    explicit Inspector(QObject *parent = 0);

    Q_INVOKABLE void update(bool choice);
    Q_INVOKABLE bool isOver();
    Q_INVOKABLE QString getOverMessage();
    Q_INVOKABLE void reset();

    void setRealmModel(RealmModel * realm) { _realm = realm; }
    void setEventModel(EventModel * event) { _event = event; }
    void setPlayerModel(PlayerModel * player) { _player = player; }
    void setEvents(QVector <Event> events) { _events = events; }
private:
    void update(Event::Influence influence);
    Event getRandomEvent();
};

#endif // INSPECTOR_H
