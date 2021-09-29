import '../../domain/entity/film_entity.dart';
import '../../domain/usecases/usecases.dart';
import '../data.dart';

class RemoteLoadFilmByCategory implements LoadFilmByCategory {
  final HTTPClient httpClient;
  final String url;

  RemoteLoadFilmByCategory({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<List<FilmEntity>> loadFilmsByCategory({required String category}) async {
    final List<dynamic> response = await httpClient.request(url: url, method: HTTPMethod.get);

    return response.map((film) => RemoteFilmModel.fromJson(film).toEntity()).toList();
  }
}
