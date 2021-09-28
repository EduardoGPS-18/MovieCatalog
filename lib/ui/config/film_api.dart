// ignore_for_file: constant_identifier_names

import 'api_key.dart';

class FilmApi {
  static const RELEASES_FILM = "https://imdb-api.com/br/API/ComingSoon/$API_KEY";
  static String getApiPathByCategory(String category) => "https://imdb-api.com/br/API/Keyword/$API_KEY/$category";
  static String getApiPathByFilmId(String id) => "https://imdb-api.com/en/API/Title/$API_KEY/$id";
}
