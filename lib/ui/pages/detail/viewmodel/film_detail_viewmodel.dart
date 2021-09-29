import 'dart:convert';

import '../../../../data/data.dart';
import '../../../../data/models/actor_model.dart';
import '../../../../domain/domain.dart';
import '../../../../domain/entity/film_information_entity.dart';

class FilmInformationViewModel {
  String image;
  String title;
  List<ActorEntity> actorList;
  String synopsis;

  FilmInformationViewModel({
    required this.image,
    required this.title,
    required this.actorList,
    required this.synopsis,
  });

  factory FilmInformationViewModel.fromRemoteFilmInformation(RemoteFilmInformation film) {
    return FilmInformationViewModel(
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

  factory FilmInformationViewModel.fromEntity(FilmInformationEntity entity) {
    return FilmInformationViewModel(image: entity.image, title: entity.title, actorList: entity.actorList, synopsis: entity.synopsis);
  }

  factory FilmInformationViewModel.fromMap(Map<String, dynamic> map) {
    return FilmInformationViewModel(
      image: map['image'],
      title: map['title'],
      actorList: List.from(map['actorList'] ?? []).map((e) => ActorModel.fromMap(e)).toList(),
      synopsis: map['synopsis'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmInformationViewModel.fromJson(String source) => FilmInformationViewModel.fromMap(json.decode(source));

  factory FilmInformationViewModel.empty() {
    return FilmInformationViewModel(image: "", title: "", actorList: [], synopsis: "");
  }
}
