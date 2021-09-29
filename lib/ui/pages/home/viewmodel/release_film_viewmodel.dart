import 'dart:convert';

import '../../../../data/data.dart';
import '../../../../domain/domain.dart';

class ReleaseFilmViewModel {
  String id;
  String title;
  List<String> starList;
  String image;

  ReleaseFilmViewModel({
    required this.id,
    required this.title,
    required this.starList,
    required this.image,
  });

  factory ReleaseFilmViewModel.fromEntity(ReleasFilmEntity entity) {
    return ReleaseFilmViewModel(id: entity.id, title: entity.title, starList: entity.starList, image: entity.image);
  }

  factory ReleaseFilmViewModel.fromRemoteReleaseFilmModel(RemoteReleaseFilmModel remoteReleaseFilmModel) {
    return ReleaseFilmViewModel(
      id: remoteReleaseFilmModel.id,
      title: remoteReleaseFilmModel.title,
      starList: remoteReleaseFilmModel.starList,
      image: remoteReleaseFilmModel.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'starList': starList,
      'image': image,
    };
  }

  factory ReleaseFilmViewModel.fromMap(Map<String, dynamic> map) {
    return ReleaseFilmViewModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      starList: List.from(map['starList']).map((e) => e["name"].toString()).toList(),
      image: map['image'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ReleaseFilmViewModel.fromJson(String source) => ReleaseFilmViewModel.fromMap(json.decode(source));
}
