import 'dart:convert';

import '../../domain/entity/entity.dart';
import 'models.dart';

class RemoteFilmInformation {
  String id;
  String title;
  String originalTitle;
  String fullTitle;
  String type;
  String year;
  String image;
  String awards;
  String plot;
  List<String> directorList;
  List<String> writerList;
  List<String> starList;
  List<ActorModel> actorList;
  List<String> genreList;

  RemoteFilmInformation({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.image,
    required this.awards,
    required this.plot,
    required this.directorList,
    required this.writerList,
    required this.starList,
    required this.actorList,
    required this.genreList,
  });

  FilmInformationEntity toEntity() {
    return FilmInformationEntity(synopsis: plot, id: id, title: title, image: image, actorList: actorList);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'originalTitle': originalTitle,
      'fullTitle': fullTitle,
      'type': type,
      'year': year,
      'image': image,
      'awards': awards,
      'directorList': directorList,
      'writerList': writerList,
      'starList': starList,
      'actorList': [...actorList.map((e) => e.toMap()).toList()],
      'genreList': genreList,
    };
  }

  factory RemoteFilmInformation.fromMap(Map<String, dynamic> map) {
    return RemoteFilmInformation(
      id: map['id'] ?? "0000",
      title: map['title'] ?? "Sem titulo definido!",
      plot: map['plot'] ?? "Sem sinopse definida",
      originalTitle: map['originalTitle'] ?? "Sem titulo original definido",
      fullTitle: map['fullTitle'] ?? "Sem titulo completo definido",
      type: map['type'] ?? "Sem tipo definido",
      year: map['year'] ?? "0000",
      image: map['image'] ?? "https://imdb-api.com/images/original/nopicture.jpg",
      awards: map['awards'] ?? "Sem premios definidos",
      directorList: List.from(map['directorList'] ?? []).map((e) => e["name"].toString()).toList(),
      writerList: List.from(map['writerList'] ?? []).map((e) => e["name"].toString()).toList(),
      starList: List.from(map['starList'] ?? []).map((e) => e["name"].toString()).toList(),
      actorList: List.from(map['actorList'] ?? []).map((e) => ActorModel.fromMap(e)).toList(),
      genreList: List.from(map['genreList'] ?? []).map((e) => e["value"].toString()).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteFilmInformation.fromJson(String source) => RemoteFilmInformation.fromMap(json.decode(source));
}
