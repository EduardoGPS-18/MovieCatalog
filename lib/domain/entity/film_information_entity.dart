import 'package:equatable/equatable.dart';

import '../domain.dart';

class FilmInformationEntity extends Equatable {
  final String id;
  final String title;
  final String image;
  final String synopsis;
  final List<ActorEntity> actorList;

  const FilmInformationEntity({
    required this.synopsis,
    required this.id,
    required this.title,
    required this.image,
    required this.actorList,
  });

  @override
  List<Object> get props => [id, title, image, title, synopsis];
}
