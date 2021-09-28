import 'dart:async';

import '../../data/data.dart';
import '../../infra/http/http.dart';
import '../../ui/config/config.dart';
import '../../ui/pages/home/home.dart';
import '../../ui/pages/home/viewmodel/film_viewmodel.dart';
import '../../ui/pages/home/viewmodel/release_film_viewmodel.dart';

class StreamHomePresenter implements HomePresenter {
  HTTPClient client;

  final StreamController<List<FilmViewModel>> _dramasStreamController = StreamController<List<FilmViewModel>>();
  final StreamController<List<FilmViewModel>> _arsenalStreamController = StreamController<List<FilmViewModel>>();
  final StreamController<List<FilmViewModel>> _ghostStoryStreamController = StreamController<List<FilmViewModel>>();
  final StreamController<List<ReleaseFilmViewModel>> _releasesFilmStream = StreamController();

  @override
  Stream<List<ReleaseFilmViewModel>> get releasesFilmStream => _releasesFilmStream.stream;

  @override
  Map<String, Stream<List<FilmViewModel>>> get filmStream => {
        "dramas": _dramasStreamController.stream,
        "arsenal": _arsenalStreamController.stream,
        "ghost-story": _ghostStoryStreamController.stream,
      };

  Map<String, Sink<List<FilmViewModel>>> get filmSink => {
        "dramas": _dramasStreamController.sink,
        "arsenal": _arsenalStreamController.sink,
        "ghost-story": _ghostStoryStreamController.sink,
      };

  StreamHomePresenter(this.client);

  @override
  Future<void> getReleases() async {
    Map<String, dynamic> mapFilms = await client.request(url: FilmApi.RELEASES_FILM, method: HTTPMethod.get);

    final List<ReleaseFilmViewModel> filmList = [];
    for (Map<String, dynamic> film in (mapFilms["items"] as List)) {
      ReleaseFilmViewModel currentFilm = ReleaseFilmViewModel.fromRemoteReleaseFilmModel(RemoteReleaseFilmModel.fromMap(film));
      filmList.add(currentFilm);
    }
    _releasesFilmStream.add(filmList);
  }

  @override
  Future<void> getFilmsByCategory(String category) async {
    Map<String, dynamic> mapFilms = await client.request(
      url: FilmApi.getApiPathByCategory(category),
      method: HTTPMethod.get,
    );
    final List<FilmViewModel> filmList = [];
    if (mapFilms["items"] == null) {
      return;
    }
    for (Map<String, dynamic> film in (mapFilms["items"] as List)) {
      RemoteFilmModel currentFilm = RemoteFilmModel.fromMap(film);
      filmList.add(FilmViewModel.fromRemoteFilmModel(currentFilm));
    }
    if (filmSink.containsKey(category)) {
      filmSink[category]!.add(filmList);
    }
  }
}
