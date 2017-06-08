#ifndef PLAYER_H
#define PLAYER_H

#include <QString>

// A structure that stores player data.
struct Player
{
    QString name;
    QString nickname;
    int reignTime;

    Player() = default;

    Player(const QString & n, const QString & nn, int r = 0)
        : name(n), nickname(nn), reignTime(r) {}
};

#endif // PLAYER_H
