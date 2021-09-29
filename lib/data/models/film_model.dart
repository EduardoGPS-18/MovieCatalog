import 'dart:convert';

import '../../domain/domain.dart';

class RemoteFilmModel {
  String id;
  String title;
  String image;
  String year;
  double imDbRating;

  RemoteFilmModel({
    required this.id,
    required this.title,
    required this.image,
    required this.year,
    required this.imDbRating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'year': year,
      'imDbRating': imDbRating,
    };
  }

  factory RemoteFilmModel.fromMap(Map<String, dynamic> map) {
    return RemoteFilmModel(
      id: map['id'] ?? "0000",
      title: map['title'] ?? "Titulo não definido",
      image: map['image'] ?? "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg",
      year: map['year'] ?? "0000",
      imDbRating: double.tryParse(map['imDbRating'] ?? "") ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteFilmModel.fromJson(String source) => RemoteFilmModel.fromMap(json.decode(source));

  FilmEntity toEntity() {
    return FilmEntity(id: id, title: title, image: image);
  }
}
