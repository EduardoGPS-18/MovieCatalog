import 'viewmodel/film_viewmodel.dart';

abstract class ViewMorePresenter {
  Stream<List<FilmViewModel>> get filmsStream;

  Future<void> getFilmsByCategory(String category);
}
