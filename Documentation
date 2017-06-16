# First steps

## C++
### Struktury, modele danych
- **Event** (Event.h) - wydarzenie: treść wydarzenia, ścieżka do pliku avatara, nazwa bohatera (odpowiedzialnego za wywołanie wydarzenia), wpływ decyzji na władzę,
- **Player** (Player.h) - gracz: nazwa gracza, przydomek, czas panowania),
- **Realm** (Realm.h) - królestwo: wpływ na duchowieństwo, wpływ na armię, zdrowie monarchy, bogactwo.
### Klasy, komunikacja między QML a C++
Poniższe klasy są pochodnymi klasy QObject, rozszerzającej standardowy C++. Każda z nich jest w relacji przyjaźni z klasą Inspector, która nimi zarządza.
*Property*, a także *sygnały* oraz *sloty*, pozwalają na komunikację między C++ a QML, więc reakcje na działania użytkownika.
- **EventModel** (EventModel.h),
- **PlayerModel** (PlayerModel.h),
- **RealmModel** (RealmModel.h).
### Klasy, zarządzanie danymi
- **EventsGrasper** (EventsGrasper.h) - wczytywanie wydarzeń z pliku,
- **Inspector** (Inspector.h) - zarządzanie klasami *EventModel*, *PlayerModel*, i *RealmModel*; przechowuje wszystkie wydarzenia zwrócone przez *EventsGrasper*; aktualizuje UI.
### Pliki źródłowe
Pliki inicjalizujące aplikację:
- main.cpp
Implementacje klas:
- EventModel.cpp
- PlayerModel.cpp
- RealmModel.cpp
- EventsGrasper.cpp
- Inspecotr.cpp

## QML
W pliku main.qml znajduje się kod UI aplikacji.
- **GameView** (GameView.qml) - definicja okna rozgrywki,
- **GameViewTop** (GameViewTop.qml) - górny komponent okna rozgrywki,
- **GameViewMid** (GameViewMid.qml) - środkowy komponent okna rozgrywki,
- **GameViewBot** (GameViewBot.qml) - dolny komponent okna rozgrywki,
- **StartView** (StartView.qml) - ekran powitalny,
- **EndView** (EndView.qml) - podsumowanie rozgrywki,
