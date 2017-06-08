#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QVector>
#include <QString>

#include "Event.h"
#include "Data.h"

class Controller : public QObject
{
    Q_OBJECT

private:
    // realm state properties
    Q_PROPERTY(QString clergy READ clergy WRITE setClergy NOTIFY clergyChanged)
    Q_PROPERTY(QString army READ army WRITE setArmy NOTIFY armyChanged)
    Q_PROPERTY(QString health READ health WRITE setHealth NOTIFY healthChanged)
    Q_PROPERTY(QString wealth READ wealth WRITE setWealth NOTIFY wealthChanged)
    // player data properties
    Q_PROPERTY(QString playerName READ playerName WRITE setPlayerName NOTIFY playerNameChanged)
    Q_PROPERTY(QString reignTime READ reignTime WRITE setReignTime NOTIFY reignTimeChanged)
    Q_PROPERTY(QString nickname READ nickname WRITE setNickname NOTIFY nicknameChanged)
    // event properties
    Q_PROPERTY(QString message READ message NOTIFY messageChanged)
    Q_PROPERTY(QString avatarUrl READ avatarUrl NOTIFY avatarUrlChanged)
    Q_PROPERTY(QString character READ character NOTIFY characterChanged)
    // other properties
    Q_PROPERTY(QString year READ year WRITE setYear NOTIFY yearChanged)

    Data _data;
    Event _event;

    QVector <Event> _events;

public:
    // constructors
    explicit Controller(QObject *parent = 0);
    Controller(Data data, const QVector <Event> & events);

    // functions
    Q_INVOKABLE void update(bool isNo);

    // realm getters
    QString clergy() const { return QString::number(_data.realm.clergy); }
    QString army() const { return QString::number(_data.realm.army); }
    QString health() const { return QString::number(_data.realm.health); }
    QString wealth() const { return QString::number(_data.realm.wealth); }
    // player getters
    QString playerName() const { return _data.player.name; }
    QString nickname() const { return _data.player.nickname; }
    QString reignTime() const { return QString::number(_data.player.reignTime); }
    // event getters
    QString message() const { return _event.message; }
    QString avatarUrl() const { return _event.avatarUrl; }
    QString character() const { return _event.character; }
    // other getters
    QString year() const { return QString::number(_data.year); }

signals:
    void clergyChanged();
    void armyChanged();
    void healthChanged();
    void wealthChanged();
    void playerNameChanged();
    void nicknameChanged();
    void reignTimeChanged();
    void messageChanged();
    void avatarUrlChanged();
    void characterChanged();
    void yearChanged();

public slots:
    // realm setters
    void setClergy(QString clergy) { _data.realm.clergy = clergy.toInt(); }
    void setArmy(QString army) { _data.realm.army = army.toInt(); }
    void setHealth(QString health) { _data.realm.health = health.toInt(); }
    void setWealth(QString wealth) { _data.realm.wealth = wealth.toInt(); }
    // player setters
    void setPlayerName(QString playerName) { _data.player.name = playerName; }
    void setReignTime(QString reignTime) { _data.player.reignTime = reignTime.toInt(); }
    void setNickname(QString nickname) { _data.player.nickname = nickname; }
    // other setters
    void setYear(QString year) { _data.year = year.toInt(); }

private:
    void update(Event::Influence influence);
    Event getRandomEvent();
    void syncRealm();
    void syncTime();
    void syncEvent();
};

#endif // REIGNCONTROLLER_H
