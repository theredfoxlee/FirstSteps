#include "RealmModel.h"

RealmModel::RealmModel(QObject *parent)
    : QObject(parent)
{
    // empty
}

RealmModel::RealmModel(Realm realmData)
    : _realm(realmData)
{
    // empty
}

void RealmModel::synchronize()
{
    clergyChanged();
    armyChanged();
    healthChanged();
    wealthChanged();
}
