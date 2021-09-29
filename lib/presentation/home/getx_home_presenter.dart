import 'dart:async';

import 'package:get/get.dart';

import '../../data/data.dart';
import '../../infra/http/http.dart';
import '../../ui/config/config.dart';
import '../../ui/pages/home/home.dart';
import '../../ui/pages/home/viewmodel/film_viewmodel.dart';
import '../../ui/pages/home/viewmodel/release_film_viewmodel.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  HTTPClient client;

  final Rx<List<FilmViewModel>> _dramasStreamController = Rx<List<FilmViewModel>>([]);
  final Rx<List<FilmViewModel>> _arsenalStreamController = Rx<List<FilmViewModel>>([]);
  final Rx<List<FilmViewModel>> _ghostStoryStreamController = Rx<List<FilmViewModel>>([]);
  final Rx<List<ReleaseFilmViewModel>> _releasesFilmStream = Rx<List<ReleaseFilmViewModel>>([]);

  @override
  Stream<List<ReleaseFilmViewModel>> get releasesFilmStream => _releasesFilmStream.stream;

  @override
  Map<String, Stream<List<FilmViewModel>>> get filmStream => {
        "dramas": _dramasStreamController.stream,
        "arsenal": _arsenalStreamController.stream,
        "ghost-story": _ghostStoryStreamController.stream,
      };

  Map<String, GetStream<List<FilmViewModel>>> get filmSink => {
        "dramas": _dramasStreamController.subject,
        "arsenal": _arsenalStreamController.subject,
        "ghost-story": _ghostStoryStreamController.subject,
      };

  GetxHomePresenter(this.client);

  @override
  Future<void> getReleases() async {
    Map<String, dynamic> mapFilms = await client.request(url: FilmApi.RELEASES_FILM, method: HTTPMethod.get);

    final List<ReleaseFilmViewModel> filmList = [];
    for (Map<String, dynamic> film in (mapFilms["items"] as List)) {
      ReleaseFilmViewModel currentFilm = ReleaseFilmViewModel.fromRemoteReleaseFilmModel(RemoteReleaseFilmModel.fromMap(film));
      filmList.add(currentFilm);
    }
    _releasesFilmStream.subject.add(filmList);
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
