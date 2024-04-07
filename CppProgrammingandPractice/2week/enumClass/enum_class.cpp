#include <iostream>
#include <map>
#include <string>
#include <unordered_map>
#include <vector>

enum class Genre { Action, Comedy, Drama, Romance, SciFi, Unspecified };
enum class StarRating {
  OneStar,
  TwoStars,
  ThreeStars,
  FourStars,
  FiveStars,
  Unrated
};

struct Movie {
  std::string title;
  Genre genre;
  StarRating rating;
};

int ratingToInt(StarRating rating) {
  switch (rating) {
    case StarRating::OneStar:
      return 1;
    case StarRating::TwoStars:
      return 2;
    case StarRating::ThreeStars:
      return 3;
    case StarRating::FourStars:
      return 4;
    case StarRating::FiveStars:
      return 5;
    default: {
      std::cerr << "Invalid rating";
      return 0;
    }
  }
}

StarRating stringToStarRating(const std::string& stars) {
  static const std::unordered_map<std::string, StarRating> ratingsMap = {
      {"★★★★★", StarRating::FiveStars},
      {"★★★★☆", StarRating::FourStars},
      {"★★★☆☆", StarRating::ThreeStars},
      {"★★☆☆☆", StarRating::TwoStars},
      {"★☆☆☆☆", StarRating::OneStar}};

  auto it = ratingsMap.find(stars);
  if (it != ratingsMap.end()) {
    return it->second;
  } else {
    return StarRating::Unrated;
  }
}

Genre stringToGenre(const std::string& genre) {
  static const std::unordered_map<std::string, Genre> genreMap = {
      {"Action", Genre::Action},
      {"Comedy", Genre::Comedy},
      {"Drama", Genre::Drama},
      {"Romance", Genre::Romance},
      {"SciFi", Genre::SciFi}};

  auto it = genreMap.find(genre);
  if (it != genreMap.end()) {
    return it->second;
  } else {
    return Genre::Unspecified;
  }
}

std::vector<Movie> movies;
std::map<std::string, std::vector<int>> movieRatings;

int main() {
  std::string title, genre, stars;

  while (std::cin >> title) {
    if (title == "q") break;

    std::cin >> genre >> stars;
    Movie movie = {title, stringToGenre(genre), stringToStarRating(stars)};

    movies.emplace_back(movie);

    
  }
}