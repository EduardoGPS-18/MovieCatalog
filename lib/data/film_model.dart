import 'dart:convert';

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
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      image: map['image'] ?? "",
      year: map['year'] ?? "",
      imDbRating: double.tryParse(map['imDbRating'] ?? "") ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteFilmModel.fromJson(String source) => RemoteFilmModel.fromMap(json.decode(source));
}
