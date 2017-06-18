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

    ++_events_counter;
    if (_events_counter == _EVENTS_PER_YEAR) {
        _events_counter = 0;
        _player->_year += 1;
        _player->_player.reignTime += 1;
    }

    _event->synchronize();
    _realm->synchronize();
    _player->synchronize();
}

bool Inspector::isOver()
{
    return !(_realm->_realm.clergy > 0 &&
           _realm->_realm.army > 0 &&
           _realm->_realm.health > 0 &&
            _realm->_realm.wealth > 0);
}

QString Inspector::getOverMessage()
{
    if (_realm->_realm.clergy <= 0) {
        return "Clerics, though devout, do not like to hide in the shadows."
                "You did not have their support, so they rebelled against you"
                "all believers in God's people - that is all, of course."
                "You die as a traitor to religion.";
    }
    else if (_realm->_realm.army <= 0) {
        return "Military leaders have noticed your inability to manage"
                "the kingdom, especially the army. You trusted the wrong people."
                "You die in the name of a bigger purpose, they say.";
    }
    else if (_realm->_realm.health <= 0) {
        return "Although your life was full of attractions, you lived poorly."
                "You are dying of an unknown disease, probably caused by "
                "a lack of hygiene.";
    }
    else if (_realm->_realm.wealth <= 0) {
        return "You are not Lannister. You're bankrupt! You were not able to "
               "repay all your debts, and people were getting more and more nervous. "
               "You were killed in an assassination attack!";
    }
    else {
        return "The king abdicated, so we killed him. We can not afford to be weak. "
               "May the next one try harder.";
    }
}

void Inspector::reset()
{
    _event->_event = getRandomEvent();
    _realm->_realm = Realm();
    _player->_player = Player("John", "the Brave");
    _player->_year = 1000;

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
