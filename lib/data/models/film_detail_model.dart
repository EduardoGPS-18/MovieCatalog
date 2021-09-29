import 'dart:convert';

class RemoteFilmDetailModel {
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
  List<Actor> actorList;
  List<String> genreList;

  RemoteFilmDetailModel({
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

  factory RemoteFilmDetailModel.fromMap(Map<String, dynamic> map) {
    return RemoteFilmDetailModel(
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
      actorList: List.from(map['actorList'] ?? []).map((e) => Actor.fromMap(e)).toList(),
      genreList: List.from(map['genreList'] ?? []).map((e) => e["value"].toString()).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteFilmDetailModel.fromJson(String source) => RemoteFilmDetailModel.fromMap(json.decode(source));
}

class Actor {
  String id;
  String image;
  String name;
  Actor({
    required this.id,
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }

  factory Actor.fromMap(Map<String, dynamic> map) {
    return Actor(
      id: map['id'],
      image: map['image'],
      name: map['name'],
    );
  }
}
