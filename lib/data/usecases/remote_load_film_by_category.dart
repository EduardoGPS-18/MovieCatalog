import '../../domain/entity/film_entity.dart';
import '../../domain/usecases/usecases.dart';
import '../data.dart';

class RemoteLoadFilmByCategory implements LoadFilmByCategory {
  final HTTPClient client;
  final String url;

  RemoteLoadFilmByCategory({
    required this.client,
    required this.url,
  });

  @override
  Future<List<FilmEntity>> loadFilmsByCategory({required String category}) async {
    final List<dynamic> response = await client.request(url: url, method: HTTPMethod.get);

    return response.map((film) => RemoteFilmModel.fromJson(film).toEntity()).toList();
  }
}
