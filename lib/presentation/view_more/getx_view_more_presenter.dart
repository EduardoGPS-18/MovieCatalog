import 'dart:async';

import 'package:get/get.dart';

import '../../domain/domain.dart';
import '../../ui/pages/pages.dart';
import '../../ui/pages/view_more/viewmodel/view_more_film_viewmodel.dart';

class GetxViewMorePresenter extends GetxController implements ViewMorePresenter {
  LoadFilmByCategory loadFilmByCategory;
  GetxViewMorePresenter(this.loadFilmByCategory);

  final _filmStreamController = Rx<List<ViewMoreFilmViewModel>>([]);

  @override
  Stream<List<ViewMoreFilmViewModel>> get filmsStream => _filmStreamController.stream;

  @override
  Future<void> getFilmsByCategory(String category) async {
    List<FilmEntity> filmsEntity = await loadFilmByCategory.loadFilmsByCategory(category: category);

    _filmStreamController.subject.add(filmsEntity.map((filmEntity) => ViewMoreFilmViewModel.fromEntity(filmEntity)).toList());
  }
}
