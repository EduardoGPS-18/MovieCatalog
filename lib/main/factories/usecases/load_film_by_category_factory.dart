import '../../../data/usecases/remote_load_film_by_category.dart';
import '../../../domain/domain.dart';
import '../../../ui/config/config.dart';
import '../http/http_adatper_factory.dart';

LoadFilmByCategory makeLoadFilmByCategory() => RemoteLoadFilmByCategory(
      client: makeHTTPAdapter(),
      url: FilmApi.apiPathToSearchFilmsByCategory,
    );
