#include "PlayerModel.h"

PlayerModel::PlayerModel(QObject *parent)
    : QObject(parent)
{
    // empty
}

PlayerModel::PlayerModel(Player player, int year)
    : _player(player), _year(year)
{
    // empty
}

void PlayerModel::synchronize()
{
    playerNameChanged();
    nicknameChanged();
    reignTimeChanged();
    yearChanged();
}
