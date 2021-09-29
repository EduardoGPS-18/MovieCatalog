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
    final Map<String, dynamic> response = await client.request(url: "$url/$category", method: HTTPMethod.get);

    return List.from(response["items"]).map((e) => RemoteFilmModel.fromMap(e).toEntity()).toList();
  }
}
