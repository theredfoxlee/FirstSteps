#ifndef REALMMODEL_H
#define REALMMODEL_H

#include <QObject>
#include "Realm.h"

class Inspector;

class RealmModel : public QObject
{
    Q_OBJECT
    friend class Inspector;

private:
    Q_PROPERTY(QString clergy READ clergy WRITE setClergy NOTIFY clergyChanged)
    Q_PROPERTY(QString army READ army WRITE setArmy NOTIFY armyChanged)
    Q_PROPERTY(QString health READ health WRITE setHealth NOTIFY healthChanged)
    Q_PROPERTY(QString wealth READ wealth WRITE setWealth NOTIFY wealthChanged)

    Realm _realm;
public:
    explicit RealmModel(QObject *parent = 0);
    RealmModel(Realm realmData);

    QString clergy() const { return QString::number(_realm.clergy); }
    QString army() const { return QString::number(_realm.army); }
    QString health() const { return QString::number(_realm.health); }
    QString wealth() const { return QString::number(_realm.wealth); }

signals:
    void clergyChanged();
    void armyChanged();
    void healthChanged();
    void wealthChanged();

public slots:
    void setClergy(QString clergy) { _realm.clergy = clergy.toInt(); }
    void setArmy(QString army) { _realm.army = army.toInt(); }
    void setHealth(QString health) { _realm.health = health.toInt(); }
    void setWealth(QString wealth) { _realm.wealth = wealth.toInt(); }

public:
    void synchronize();
};

#endif // REALMMODEL_H
