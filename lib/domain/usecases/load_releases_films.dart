import '../../ui/pages/home/viewmodel/release_film_viewmodel.dart';

abstract class LoadReleasesFilm {
  Future<List<ReleaseFilmViewModel>> loadReleasesFilm();
}
