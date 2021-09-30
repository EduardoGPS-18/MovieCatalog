import '../../../../presentation/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../../main.dart';

ViewMorePresenter makeViewMorePresenter() => GetxViewMorePresenter(makeLoadFilmByCategory());
