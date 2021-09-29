import 'viewmodel/view_more_film_viewmodel.dart';

abstract class ViewMorePresenter {
  Stream<List<ViewMoreFilmViewModel>> get filmsStream;

  Future<void> getFilmsByCategory(String category);
}
