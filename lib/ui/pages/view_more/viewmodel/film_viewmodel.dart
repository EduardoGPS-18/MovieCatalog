import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }

  factory FilmViewModel.fromMap(Map<String, dynamic> map) {
    return FilmViewModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      image: map['image'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmViewModel.fromJson(String source) => FilmViewModel.fromMap(json.decode(source));
  factory FilmViewModel.fromRemoteFilmModel(RemoteFilmModel film) {
    return FilmViewModel(id: film.id, title: film.title, image: film.image);
  }
}
