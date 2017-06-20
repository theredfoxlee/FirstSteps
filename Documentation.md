# First steps

## C++

### Struktury, modele danych

**Event** (Event.h) 
- message: QString / *treść wydarzenia*
- avatarUrl: QString / *ścieżka do pliku avatar*
- character: QString / *nazwa bohatera (odpowiedzialengo za wywołanie wydarzenia)*
- Event() / *konstruktor inicjalizujący pola struktury domyślnymi wartościami*
- Event(QString, QString, QString, Influence, Influence) *konstruktor inicjalizujący pola struktury wartościami podanymi przez użytkownika*

**Player** (Player.h)
- name: QString / *nazwa gracza*
- nickname: QString / *przydomek*
- reignTime: int / *czas panowania*
- Player() / *konstruktor inicjalizujący pola struktury domyślnymi wartościami*
- Player(QString, QString, int) / *konstruktor inicjalizujący pola struktury wartościami podanymi przez użytkownika*

**Realm** (Realm.h)
- cleargy: int / *wpływ na duchowieństwo*
- army: int / *wpływ na armię*
- health: int / *zdrowie monarchy*
- wealth: int / *bogactwo*
- Realm(int, int, int, int) / *konstruktor inicjalizujący pola struktury domyślnymi wartościami lub podanymi przez użytkownika*


### Klasy, komunikacja między QML a C++
Poniższe klasy są pochodnymi klasy QObject, rozszerzającej standardowy C++. Każda z nich jest w relacji przyjaźni z klasą Inspector, która nimi zarządza.
*Property*, a także *sygnały* oraz *sloty*, pozwalają na komunikację między C++ a QML, więc reakcje na działania użytkownika.

**EventModel** (EventModel.h)
- _event: Event / *aktualnie przechowywane wydarzenie, do którego dostęp zapewnia system właściwości*
- EventModel(QObject \*) / *konstruktor domyślny, wymagany przez QObject, ustawiający rodzica EventModel*
- EventModel(Event) / *konstruktor inicjalizujący _event*
- message(): QString / *zwraca _event.message*
- avatarUrl(): QString / *zwraca _event..avatarUrl*
- character(): QString / *zwraca _event..character*
- messageChanged(): void / *sygnał emitowany, gdy _event.message ulegnie zmianie*
- avatarUrlChanged(): void / *sygnał emitowany, gdy _event.avatarUrl ulegnie zmianie*
- characterChanged(): void / *sygnał emitowany, gdy _event.character ulegnie zmianie*
- synchronize(): void / *emituje wszystkie sygnały w EventModel*

**PlayerModel** (PlayerModel.h)
-  _player: Player / *dane dotyczące aktualnego gracza*
- _year: int / *obecny rok w grze*
- PlayerModel(QObject \*) / *konstruktor domyślny, wymagany przez QObject, ustawiający rodzica PlayerModel*
- PlayerModel(Player, int) / *konstruktor inicjalizujący _player oraz _year*
- playerName(): QString / *zwraca _player.name*
- nickname():  QString / *zwraca _player.nickname*
- reignTime(): QString / *zwraca QString::number(_player.reignTime)*
- year(): QString / *zwraca QString::number(_year)*
- playerNameChanged(): void / *sygnał emitowany, gdy _player.name ulegnie zmianie*
- nicknameChanged(): void / *sygnał emitowany, gdy _player.nickname ulegnie zmianie*
- reignTimeChanged(): void / *sygnał emitowany, gdy _player.reignTime ulegnie zmianie*
- yearChanged(): void / *sygnał emitowany, gdy _year ulegnie zmianie*
- setPlayerName(QString): void / *ustawia _player.name oraz emituje playerNameChanged()*
- setReignTime(QString): void / *ustawia _player.reignTime  oraz emituje reignTimeChanged()*
- setNickname(QString): void / *ustawia _player.nickname oraz emituje nicknameChanged()*
- setYear(QString): void / *ustawia _yaer oraz emituje yearChanged()*
- synchronize(): void / *emituje wszystkie sygnały w PlayerModel*

**RealmModel** (RealmModel.h)
- _realm: Realm / *dane dotyczące aktualnego stanu królestwa*
- RealmModel(QObject \*) / *konstruktor domyślny, wymagany przez QObject, ustawiający rodzica RealmModel*
- RealmModel(Realm) / *konstruktor inicjalizujący _realm*
- clergy(): QString / *zwraca _realm.clergy*
- army():  QString / *zwraca _realm.army*
- health(): QString / *zwraca _realm.health*
- wealth(): QString / *zwraca _realm.wealth*
- clergyChanged(): void / *sygnał emitowany, gdy _realm.clergy ulegnie zmianie*
- armyChanged(): void / *sygnał emitowany, gdy _realm.army ulegnie zmianie*
- healthChanged(): void / *sygnał emitowany, gdy _realm.health ulegnie zmianie*
- wealthChanged(): void / *sygnał emitowany, gdy _realm.wealth ulegnie zmianie*
- setClergy(QString): void / *ustawia _realm.clergy  oraz emituje clergyChanged()*
- setArmy(QString): void / *ustawia __realm.army  oraz emituje armyChanged()*
- setHealth(QString): void / *ustawia _realm.health oraz emituje healthChanged()*
- setWealth(QString): void / *ustawia _realm.wealth oraz emituje wealthChanged()*
- synchronize(): void / *emituje wszystkie sygnały w RealmModel*

### Klasy, zarządzanie danymi

**EventsGrasper** (EventsGrasper.h)
- _location: QString / *ścieżka do pliku z wydarzeniami*
- _events: QVector<Event> / *kontener przechowujący wydarzenia*
- _imageLocation: QMap<QString, QString> / *słownik przechowujący ścieżki do avatarów*
- _error: Event / *element zwracany w przypadku niepowowdzenia*
- EventsGrasper(QString) / *konstruktor inicjalizujący _loaction danymi podanymi przez użytkownika, wartościami domyślnymi _imageLocation i _error, oraz wywołujący loadFromFile()*
- extract(): QVector<Event> / *zwraca wczytane wyderzenia lub _error (jeżeli wczytywyanie się nie powiodło)*
- loadFromFile(): void / *jeżeli to możliwe, otwiera strumień do odczytu danych z pliku oraz wywołuje readEvent()*
- readEvent(QTextStream): void / *odczytuje kolejny Event zgodnie ze schematem*

**Inspector** (Inspector.h)
- _realm: RealmModel \* / *aktualny model reprezentujacy królestwo*
- _event: EventModel \* / *aktualny model reprezentujacy wydarzenie*
- _player: PlayerModel \* / *aktualny model reprezentująćy gracza*
- _events: QVector<Event> / *możliwe wydarzenia* 
- _EVENTS_PER_YEAR: int / *prędkość zmiany roku*
- _events_counter: int / *zmienna zliczająca wydarzenia do końca roku*
- Inspector(QObject \*) / *konstruktor domyślny, wymagany przez QObject, ustawiający rodzica Inspector*
- update(bool): void / *wywołuje update(Event::Influence), aktualizuje aktualne wydarzenie oraz czas rządów gracza; true odpowiada Influence::Yes, a false odpowiada Influence::No*
- isOver: bool / *sprawdza, czy którakowlwiek ze statystyk dotyczących królestwa jest mniejsza lub równa zero*
- getOverMessage(): QString / *zwraca przyczynę końca gry*
- setRealmModel(RealmModel \*): void / *ustawia _realm*
- setEventModel(EventModel \*): void / *ustawia _event*
- setPlayerModel(PlayerModel \*): void / *ustawia _player*
- setEvents(QVector<Event>): void / *ustawia _events*
- update(Event::Influence): void / *funkcja pomocnicza, aktualziująca królestwo*
- getRandomEvent(): Event / *funkcja zwracająca losowo wybrany Event z _events*

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
- **Dragger** (Dragger.qml) - MouseArea do przeciągania okna,
- **StartView** (StartView.qml) - ekran powitalny,
- **EndView** (EndView.qml) - podsumowanie rozgrywki.

### Struktura wydarzenia do wczytania (.txt)
1. Wiadomość (1 linia)
2. Wpływ na królestwo, jeżeli gracz się zgadza (4 wartości liczbowe)
3. Wpływ na królestwo, jeżeli gracz się nie gadza (4 wartości liczbowe)
4. Nazwa bohatera, wywołującego wydarzenie (1 linia)