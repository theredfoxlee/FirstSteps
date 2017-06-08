#ifndef DATA_H
#define DATA_H

#include "Player.h"
#include "Realm.h"

// A structure that stores game data.
struct Data
{
    Player player;
    Realm realm;
    int year;

    Data() = default;

    Data(Player _player, Realm _realm, int _year = 667)
        : player(_player), realm(_realm), year(_year) {}
};

#endif // GAMEDATA_H
