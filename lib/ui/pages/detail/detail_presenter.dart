import 'dart:async';

import 'viewmodel/film_information_viewmodel.dart';

abstract class DetailPresenter {
  Stream<FilmInformationViewModel> get streamDetail;

  Future<void> loadFilmInformationByFilmId({required String filmId});
}
