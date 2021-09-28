import 'dart:convert';

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
  String imDbRaatingCount;
  String metacriticRating;
  String genres;
  List<String> genreList;
  String directors;
  List<String> directorList;
  String stars;
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
    required this.imDbRaatingCount,
    required this.metacriticRating,
    required this.genres,
    required this.genreList,
    required this.directors,
    required this.directorList,
    required this.stars,
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
      'imDbRaatingCount': imDbRaatingCount,
      'metacriticRating': metacriticRating,
      'genres': genres,
      'genreList': genreList,
      'directors': directors,
      'directorList': directorList,
      'stars': stars,
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
      imDbRaatingCount: map['imDbRaatingCount'] ?? "0",
      metacriticRating: map['metacriticRating'] ?? "0",
      genres: map['genres'] ?? "Generos indefinidos",
      genreList: List.from(map['genreList'] ?? []).map((e) => e["value"].toString()).toList(),
      directors: map['directors'] ?? "Sem diretores definidos",
      directorList: List.from(map['directorList'] ?? []).map((e) => e["name"].toString()).toList(),
      stars: map['stars'] ?? "Sem estrelas definidas",
      starList: List.from(map['starList'] ?? []).map((e) => e["name"].toString()).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteReleaseFilmModel.fromJson(String source) => RemoteReleaseFilmModel.fromMap(json.decode(source));
}
