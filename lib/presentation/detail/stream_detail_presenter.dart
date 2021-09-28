import 'dart:async';

import '../../data/data.dart';
import '../../infra/http/http.dart';
import '../../ui/config/config.dart';
import '../../ui/pages/detail/detail.dart';

class StreamDetailPresenter implements DetailPresenter {
  HTTPClient httpClient;
  final StreamController<FilmDetailViewModel> _streamController = StreamController();
  @override
  Stream<FilmDetailViewModel> get streamDetail => _streamController.stream;

  StreamDetailPresenter(this.httpClient);

  @override
  Future<void> loadFilmInformation({required String filmId}) async {
    var response = await httpClient.request(url: FilmApi.getApiPathByFilmId(filmId), method: HTTPMethod.get);
    FilmDetailViewModel film = FilmDetailViewModel.fromRemoteFilmDetail(RemoteFilmDetailModel.fromMap(response));
    _streamController.sink.add(film);
  }
}
