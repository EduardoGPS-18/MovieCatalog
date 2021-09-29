import 'dart:async';

import 'package:get/get.dart';

import '../../domain/domain.dart';
import '../../domain/entity/film_information_entity.dart';
import '../../ui/pages/detail/detail.dart';

class GetxDetailPresenter extends GetxController implements DetailPresenter {
  LoadFilmInformation filmInformation;

  GetxDetailPresenter(this.filmInformation);

  final Rx<FilmInformationViewModel> _streamController = Rx<FilmInformationViewModel>(FilmInformationViewModel.empty());

  @override
  Stream<FilmInformationViewModel> get streamDetail => _streamController.stream;

  @override
  Future<void> loadFilmInformationByFilmId({required String filmId}) async {
    FilmInformationEntity entity = await filmInformation.loadFilmInformation(filmId: filmId);

    _streamController.subject.add(FilmInformationViewModel.fromEntity(entity));
  }
}
