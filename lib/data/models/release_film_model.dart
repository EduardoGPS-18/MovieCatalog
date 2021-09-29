import 'dart:convert';

import '../../domain/domain.dart';

class RemoteReleaseFilmModel {
  String id;
  String title;
  String image;
  String fullTitle;
  String year;
  String releaseState;
  String runTimeMins;
  String runtimeStr;
  String plot;
  String contentRating;
  String imDbRating;
  String imDbRatingCount;
  String metacriticRating;
  List<String> genreList;
  List<String> directorList;
  List<String> starList;

  RemoteReleaseFilmModel({
    required this.id,
    required this.title,
    required this.image,
    required this.fullTitle,
    required this.year,
    required this.releaseState,
    required this.runTimeMins,
    required this.runtimeStr,
    required this.plot,
    required this.contentRating,
    required this.imDbRating,
    required this.imDbRatingCount,
    required this.metacriticRating,
    required this.genreList,
    required this.directorList,
    required this.starList,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'fullTitle': fullTitle,
      'year': year,
      'releaseState': releaseState,
      'runTimeMins': runTimeMins,
      'runtimeStr': runtimeStr,
      'plot': plot,
      'contentRating': contentRating,
      'imDbRating': imDbRating,
      'metacriticRating': metacriticRating,
      'genreList': genreList,
      'directorList': directorList,
      'starList': starList,
    };
  }

  factory RemoteReleaseFilmModel.fromMap(Map<String, dynamic> map) {
    return RemoteReleaseFilmModel(
      id: map['id'] ?? "000",
      title: map['title'] ?? "Sem titulo",
      image: map['image'] ?? "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg",
      fullTitle: map['fullTitle'] ?? "Sem titulo",
      year: map['year'] ?? "0000",
      releaseState: map['releaseState'] ?? "Não definido",
      runTimeMins: map['runTimeMins'] ?? "00",
      runtimeStr: map['runtimeStr'] ?? "00",
      plot: map['plot'] ?? "Sem Sinopse",
      contentRating: map['contentRating'] ?? "0",
      imDbRating: map['imDbRating'] ?? "0",
      imDbRatingCount: map['imDbRatingCount'] ?? "0",
      metacriticRating: map['metacriticRating'] ?? "0",
      genreList: List.from(map['genreList'] ?? []).map((e) => e["value"].toString()).toList(),
      directorList: List.from(map['directorList'] ?? []).map((e) => e["name"].toString()).toList(),
      starList: List.from(map['starList'] ?? []).map((e) => e["name"].toString()).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteReleaseFilmModel.fromJson(String source) => RemoteReleaseFilmModel.fromMap(json.decode(source));

  ReleasFilmEntity toEntity() {
    return ReleasFilmEntity(id: id, title: title, image: image, starList: starList);
  }
}
