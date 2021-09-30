import '../../../../presentation/detail/detail.dart';
import '../../../../ui/pages/detail/detail.dart';
import '../../usecases/load_film_information_factory.dart';

DetailPresenter makeDetailPresenter() => GetxDetailPresenter(
      makeLoadFilmInformation(),
    );
