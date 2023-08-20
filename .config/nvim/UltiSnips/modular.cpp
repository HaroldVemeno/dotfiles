#include <bits/stdc++.h>

#ifdef GUDEB
    #define D(x) cerr << #x << ": " << (x) << '\n';
    #define ifdeb if(true)
#else
    #define D(x) ;
    #define ifdeb if(false)
#endif

using namespace std;
using ll = long long;
// #define int ll;

struct Mod {
    ll v;
    //constexpr static ll m = 998'244'353;
    constexpr static ll m = 1'000'000'007;

    Mod(const ll a) : v{a % m} {}
    Mod() : v{0} {}

    Mod operator +(Mod a) { return a + v; }
    Mod operator -() { return {(-v)% m}; }
    Mod operator -(Mod a) { return *this - a.v; }
    Mod operator *(Mod a) { return a * v; }
    Mod pow(ll exp) {
        Mod b{v};
        Mod r{1};
        while(exp > 0) {
            if(exp & 1) r = r * b;
            b = b*b;
            exp /= 2;
        }
        return r;
    }

    Mod inverse() {
        return this->pow(m-2);
    }

    Mod operator /(ll a) {
        return {inverse() * a};
    }

    Mod operator /(Mod a) {
        return {inverse() * a};
    }

    operator ll() {
        return v;
    }

    friend ostream& operator <<(ostream& o, Mod a) {
        while(a.v < 0) a.v += m;
        return o << a.v;
    }
    friend istream& operator >>(istream& i, Mod a) {
        i >> a.v;
        a.v %= m;
        return i;
    }
};


int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);

    Mod a{1};
    Mod b{11};
    Mod c{Mod::m/2 + 1};
    cout << b << ' ';
    cout << b.inverse() << ' ';
    cout << b * b.inverse() << ' ';
    cout << c << ' ';
    cout << c.inverse() << ' ';
}

