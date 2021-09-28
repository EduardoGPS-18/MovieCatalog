import '../../../../data/data.dart';

class FilmViewModel {
  String id;
  String title;
  String image;

  FilmViewModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory FilmViewModel.fromRemoteFilmModel(RemoteFilmModel filmModel) {
    return FilmViewModel(
      id: filmModel.id,
      title: filmModel.title,
      image: filmModel.image,
    );
  }
}
