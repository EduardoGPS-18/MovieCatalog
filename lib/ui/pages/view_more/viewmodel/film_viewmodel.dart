import 'dart:convert';

import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class ViewMoreFilmViewModel {
  String id;
  String title;
  String image;
  ViewMoreFilmViewModel({
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

  factory ViewMoreFilmViewModel.fromMap(Map<String, dynamic> map) {
    return ViewMoreFilmViewModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      image: map['image'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ViewMoreFilmViewModel.fromJson(String source) => ViewMoreFilmViewModel.fromMap(json.decode(source));
  factory ViewMoreFilmViewModel.fromRemoteFilmModel(RemoteFilmModel film) {
    return ViewMoreFilmViewModel(id: film.id, title: film.title, image: film.image);
  }

  factory ViewMoreFilmViewModel.fromEntity(FilmEntity entity) {
    return ViewMoreFilmViewModel(id: entity.id, title: entity.title, image: entity.image);
  }
}
