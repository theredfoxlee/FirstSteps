#ifndef EVENT_H
#define EVENT_H

#include <QString>

// A structure that stores event.
struct Event
{
    QString message;
    QString avatarUrl;
    QString character;

    struct Influence
    {
        int clergy;
        int army;
        int health;
        int wealth;

        Influence() = default;

        Influence(int c, int a, int h, int w)
            : clergy(c), army(a), health(h), wealth(w) {}
    } yes, no;

    Event() = default;

    Event(const QString & m, const QString & a, const QString & ch, Influence y, Influence n)
        : message(m), avatarUrl(a), character(ch), yes(y), no(n) {}
};

#endif // EVENT_H
