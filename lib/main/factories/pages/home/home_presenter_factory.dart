import '../../../../presentation/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../usecases/usecases.dart';

HomePresenter makeHomePresenter() => GetxHomePresenter(
      loadReleasesFilm: makeLoadReleasesFilm(),
      loadFilmByCategory: makeLoadFilmByCategory(),
    );
