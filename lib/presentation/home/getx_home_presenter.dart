import 'dart:async';

import 'package:get/get.dart';

import '../../domain/domain.dart';
import '../../ui/pages/home/home.dart';
import '../../ui/pages/home/viewmodel/viewmodel.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  LoadReleasesFilm loadReleasesFilm;
  LoadFilmByCategory loadFilmByCategory;

  GetxHomePresenter({
    required this.loadReleasesFilm,
    required this.loadFilmByCategory,
  });

  final Rx<List<HomeFilmViewModel>> _gunStreamController = Rx<List<HomeFilmViewModel>>([]);
  final Rx<List<HomeFilmViewModel>> _arsenalStreamController = Rx<List<HomeFilmViewModel>>([]);
  final Rx<List<HomeFilmViewModel>> _ghostStoryStreamController = Rx<List<HomeFilmViewModel>>([]);
  final Rx<List<ReleaseFilmViewModel>> _releasesFilmStream = Rx<List<ReleaseFilmViewModel>>([]);

  @override
  Stream<List<ReleaseFilmViewModel>> get releasesFilmStream => _releasesFilmStream.stream;

  @override
  Map<String, Stream<List<HomeFilmViewModel>>> get filmStream => {
        "gun": _gunStreamController.stream,
        "arsenal": _arsenalStreamController.stream,
        "battle": _ghostStoryStreamController.stream,
      };

  Map<String, GetStream<List<HomeFilmViewModel>>> get filmSink => {
        "gun": _gunStreamController.subject,
        "arsenal": _arsenalStreamController.subject,
        "battle": _ghostStoryStreamController.subject,
      };

  @override
  Future<void> getReleases() async {
    List<ReleasFilmEntity> mapFilms = await loadReleasesFilm.loadReleasesFilm();

    _releasesFilmStream.subject.add(mapFilms.map((entity) => ReleaseFilmViewModel.fromEntity(entity)).toList());
  }

  @override
  Future<void> getFilmsByCategory(String category) async {
    List<FilmEntity> mapFilms = await loadFilmByCategory.loadFilmsByCategory(category: category);

    if (filmSink.containsKey(category)) {
      filmSink[category]!.add(mapFilms.map((entity) => HomeFilmViewModel.fromEntity(entity)).toList());
    }
  }
}
