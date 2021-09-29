import '../entity/film_information_entity.dart';

abstract class LoadFilmInformation {
  Future<FilmInformationEntity> loadFilmInformation({required String filmId});
}
