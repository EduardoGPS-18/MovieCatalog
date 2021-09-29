import 'dart:async';

import 'package:get/get.dart';

import '../../data/data.dart';
import '../../infra/http/http.dart';
import '../../ui/config/config.dart';
import '../../ui/pages/detail/detail.dart';

class GetxDetailPresenter extends GetxController implements DetailPresenter {
  HTTPClient httpClient;

  GetxDetailPresenter(this.httpClient);

  final Rx<FilmDetailViewModel> _streamController = Rx<FilmDetailViewModel>(FilmDetailViewModel.empty());

  @override
  Stream<FilmDetailViewModel> get streamDetail => _streamController.stream;

  @override
  Future<void> loadFilmInformation({required String filmId}) async {
    var response = await httpClient.request(url: FilmApi.getApiPathByFilmId(filmId), method: HTTPMethod.get);
    FilmDetailViewModel film = FilmDetailViewModel.fromRemoteFilmDetail(RemoteFilmDetailModel.fromMap(response));
    _streamController.subject.add(film);
  }
}
