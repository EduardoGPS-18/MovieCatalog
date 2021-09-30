import '../../../data/usecases/usecases.dart';
import '../../../domain/domain.dart';
import '../../../ui/config/config.dart';
import '../http/http_adatper_factory.dart';

LoadReleasesFilm makeLoadReleasesFilm() => RemoteLoadReleasesFilms(
      client: makeHTTPAdapter(),
      url: FilmApi.RELEASES_FILM,
    );
