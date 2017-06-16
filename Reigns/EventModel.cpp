#include "EventModel.h"

EventModel::EventModel(QObject *parent) : QObject(parent)
{
    // empty
}

EventModel::EventModel(Event event)
    : _event(event)
{
    // empty
}

void EventModel::synchronize()
{
    messageChanged();
    avatarUrlChanged();
    characterChanged();
}
