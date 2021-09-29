import 'viewmodel/viewmodel.dart';

abstract class HomePresenter {
  Map<String, Stream<List<HomeFilmViewModel>>> get filmStream;
  Stream<List<ReleaseFilmViewModel>> get releasesFilmStream;

  Future<void> getReleases();

  Future<void> getFilmsByCategory(String category);
}
