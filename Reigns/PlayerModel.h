#ifndef PLAYERMODEL_H
#define PLAYERMODEL_H

#include <QObject>
#include "Player.h"

class Inspector;

class PlayerModel : public QObject
{
    Q_OBJECT
    friend class Inspector;

private:
    Q_PROPERTY(QString playerName READ playerName WRITE setPlayerName NOTIFY playerNameChanged)
    Q_PROPERTY(QString reignTime READ reignTime WRITE setReignTime NOTIFY reignTimeChanged)
    Q_PROPERTY(QString nickname READ nickname WRITE setNickname NOTIFY nicknameChanged)
    Q_PROPERTY(QString year READ year WRITE setYear NOTIFY yearChanged)

    Player _player;
    int _year;

public:
    explicit PlayerModel(QObject *parent = 0);
    PlayerModel(Player player, int year = 1000);

    QString playerName() const { return _player.name; }
    QString nickname() const { return _player.nickname; }
    QString reignTime() const { return QString::number(_player.reignTime); }
    QString year() const { return QString::number(_year); }

signals:
    void playerNameChanged();
    void nicknameChanged();
    void reignTimeChanged();
    void yearChanged();

public slots:
    void setPlayerName(QString playerName) { _player.name = playerName; }
    void setReignTime(QString reignTime) { _player.reignTime = reignTime.toInt(); }
    void setNickname(QString nickname) { _player.nickname = nickname; }
    void setYear(QString year) { _year = year.toInt(); }

public:
    void synchronize();
};

#endif // PLAYERMODEL_H
