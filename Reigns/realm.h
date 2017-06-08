#ifndef REALM_H
#define REALM_H

// A structure that stores realm data.
struct Realm
{
    int clergy;
    int army;
    int health;
    int wealth;

    Realm(int c = 100, int a = 100, int h = 100, int w = 100)
        : clergy(c), army(a), health(h), wealth(w) {}
};

#endif // REALM_H
