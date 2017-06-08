#include "Controller.h"

#include <QDebug> // just for tests
#include <random>
#include <chrono>

Controller::Controller(QObject *parent)
    : QObject(parent)
{
    // empty
}

Controller::Controller(Data data, const QVector <Event> & events)
    : _data(data), _events(events)
{
    _event = getRandomEvent();
}

void Controller::update(bool isNo)
{
    isNo ? update(_event.no) : update(_event.yes);

    _event = getRandomEvent();

    syncRealm();
    syncEvent();
    syncTime();
}

void Controller::update(Event::Influence influence)
{
    _data.realm.clergy += influence.clergy;
    _data.realm.army += influence.army;
    _data.realm.health += influence.health;
    _data.realm.wealth += influence.wealth;
}

Event Controller::getRandomEvent()
{
    std::default_random_engine rd(std::chrono::steady_clock::now().time_since_epoch().count());
    std::uniform_int_distribution<int> dis(0, _events.size() - 1);

    int  pos = dis(rd);
    qDebug() << pos;
    qDebug() << _events.size();
    return _events.at(pos);
}

void Controller::syncRealm()
{
    clergyChanged();
    armyChanged();
    healthChanged();
    wealthChanged();
}

void Controller::syncEvent()
{
    messageChanged();
    avatarUrlChanged();
    characterChanged();
}

void Controller::syncTime()
{
    reignTimeChanged();
    yearChanged();
}
