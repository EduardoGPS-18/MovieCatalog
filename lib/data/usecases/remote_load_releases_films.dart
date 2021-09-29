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
    Map<String, dynamic> res = await client.request(url: url, method: HTTPMethod.get);

    return List.from(res["items"]).map((film) => RemoteReleaseFilmModel.fromMap(film).toEntity()).toList();
  }
}
