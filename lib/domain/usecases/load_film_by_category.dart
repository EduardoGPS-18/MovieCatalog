import '../domain.dart';

abstract class LoadFilmByCategory {
  Future<List<FilmEntity>> loadFilmsByCategory({required String category});
}
