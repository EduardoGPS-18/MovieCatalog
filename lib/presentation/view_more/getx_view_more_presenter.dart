import 'dart:async';

import 'package:get/get.dart';

import '../../data/data.dart';
import '../../infra/http/http.dart';
import '../../ui/config/config.dart';
import '../../ui/pages/pages.dart';
import '../../ui/pages/view_more/viewmodel/film_viewmodel.dart';

class GetxViewMorePresenter extends GetxController implements ViewMorePresenter {
  HTTPClient client;
  GetxViewMorePresenter(this.client);

  final _filmStreamController = Rx<List<FilmViewModel>>([]);

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

    _filmStreamController.subject.add(filmList);
  }
}
