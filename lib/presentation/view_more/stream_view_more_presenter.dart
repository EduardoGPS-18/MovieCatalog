import 'dart:async';

import '../../data/data.dart';
import '../../infra/http/http.dart';
import '../../ui/config/config.dart';
import '../../ui/pages/pages.dart';
import '../../ui/pages/view_more/viewmodel/film_viewmodel.dart';

class StreamViewMorePresenter implements ViewMorePresenter {
  HTTPClient client;
  StreamViewMorePresenter(this.client);

  final StreamController<List<FilmViewModel>> _filmStreamController = StreamController<List<FilmViewModel>>();
  @override
  Stream<List<FilmViewModel>> get filmsStream => _filmStreamController.stream;

  @override
  Future<void> getFilmsByCategory(String category) async {
    var response = await client.request(url: FilmApi.getApiPathByCategory(category), method: HTTPMethod.get);
    final List<FilmViewModel> filmList = [];

    for (Map<String, dynamic> film in (response["items"] as List)) {
      RemoteFilmModel currentFilm = RemoteFilmModel.fromMap(film);
      filmList.add(FilmViewModel.fromRemoteFilmModel(currentFilm));
    }

    _filmStreamController.add(filmList);
  }
}
