import '../../domain/domain.dart';
import '../../domain/entity/film_information_entity.dart';
import '../data.dart';

class RemoteLoadFilmInformation implements LoadFilmInformation {
  HTTPClient client;
  String url;

  RemoteLoadFilmInformation({
    required this.client,
    required this.url,
  });

  @override
  Future<FilmInformationEntity> loadFilmInformation({required String filmId}) async {
    Map<String, dynamic> response = await client.request(url: "$url/$filmId", method: HTTPMethod.get);
    return RemoteFilmInformation.fromMap(response).toEntity();
  }
}
