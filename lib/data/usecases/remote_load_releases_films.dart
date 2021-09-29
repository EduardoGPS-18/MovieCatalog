import '../../domain/domain.dart';
import '../data.dart';

class RemoteLoadReleasesFilms implements LoadReleasesFilm {
  final HTTPClient client;
  final String url;

  RemoteLoadReleasesFilms({
    required this.client,
    required this.url,
  });

  @override
  Future<List<ReleasFilmEntity>> loadReleasesFilm() async {
    List<dynamic> res = await client.request(url: url, method: HTTPMethod.get);
    return res.map((film) => RemoteReleaseFilmModel.fromJson(film).toEntity()).toList();
  }
}
