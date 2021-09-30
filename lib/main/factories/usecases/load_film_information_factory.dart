import '../../../data/usecases/usecases.dart';
import '../../../domain/domain.dart';
import '../../../ui/config/config.dart';
import '../http/http.dart';

LoadFilmInformation makeLoadFilmInformation() => RemoteLoadFilmInformation(
      client: makeHTTPAdapter(),
      url: FilmApi.apiPathToSearchFilmInformation,
    );
