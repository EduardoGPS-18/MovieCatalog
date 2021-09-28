import 'dart:async';

import 'viewmodel/film_detail_viewmodel.dart';

abstract class DetailPresenter {
  Stream<FilmDetailViewModel> get streamDetail;

  Future<void> loadFilmInformation({required String filmId});
}
