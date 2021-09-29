import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class HomeFilmViewModel {
  String id;
  String title;
  String image;

  HomeFilmViewModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory HomeFilmViewModel.fromRemoteFilmModel(RemoteFilmModel filmModel) {
    return HomeFilmViewModel(
      id: filmModel.id,
      title: filmModel.title,
      image: filmModel.image,
    );
  }

  factory HomeFilmViewModel.fromEntity(FilmEntity entity) {
    return HomeFilmViewModel(id: entity.id, title: entity.title, image: entity.image);
  }
}
