#include "Inspector.h"

#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>

#include <random>
#include <chrono>

#include "Player.h"
#include "Realm.h"

#include <QDebug>

Inspector::Inspector(QObject *parent)
    : QObject(parent)
{
    // empty
}

void Inspector::update(bool choice)
{
    choice ? update(_event->_event.no) : update(_event->_event.yes);

    _event->_event = getRandomEvent();

    _event->synchronize();
    _realm->synchronize();
    _player->synchronize();
}

void Inspector::update(Event::Influence influence)
{
    _realm->_realm.clergy += influence.clergy;
    _realm->_realm.army += influence.army;
    _realm->_realm.health += influence.health;
    _realm->_realm.wealth += influence.wealth;
}

Event Inspector::getRandomEvent()
{
    std::default_random_engine rd(std::chrono::steady_clock::now().time_since_epoch().count());
    std::uniform_int_distribution<int> dis(0, _events.size() - 1);

    int  pos = dis(rd);
    return _events.at(pos);
}
