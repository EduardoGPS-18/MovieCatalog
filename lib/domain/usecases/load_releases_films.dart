import '../domain.dart';

abstract class LoadReleasesFilm {
  Future<List<ReleasFilmEntity>> loadReleasesFilm();
}
