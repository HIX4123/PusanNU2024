#include <map>

enum class Genre { Action, Comedy, Drama, Romance, SciFi };
enum class Rating { Onestar, Twostars, Threestars, Fourstars, Fivestars };

int main() { std::map<int, Rating, Genre> movieRatings; }