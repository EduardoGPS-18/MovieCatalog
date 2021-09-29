import 'dart:convert';

import '../../../../data/data.dart';

class FilmDetailViewModel {
  String image;
  String title;
  List<Actor> actorList;
  String synopsis;

  FilmDetailViewModel({
    required this.image,
    required this.title,
    required this.actorList,
    required this.synopsis,
  });

  factory FilmDetailViewModel.fromRemoteFilmDetail(RemoteFilmDetailModel film) {
    return FilmDetailViewModel(
      image: film.image,
      title: film.title,
      actorList: film.actorList,
      synopsis: film.plot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'actorList': actorList,
      'synopsis': synopsis,
    };
  }

  factory FilmDetailViewModel.fromMap(Map<String, dynamic> map) {
    return FilmDetailViewModel(
      image: map['image'],
      title: map['title'],
      actorList: List.from(map['actorList'] ?? []).map((e) => Actor.fromMap(e)).toList(),
      synopsis: map['synopsis'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmDetailViewModel.fromJson(String source) => FilmDetailViewModel.fromMap(json.decode(source));

  factory FilmDetailViewModel.empty() {
    return FilmDetailViewModel(image: "", title: "", actorList: [], synopsis: "");
  }
}
