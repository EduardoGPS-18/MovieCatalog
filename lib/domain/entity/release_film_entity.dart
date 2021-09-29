import 'package:equatable/equatable.dart';

class ReleasFilmEntity extends Equatable {
  final String id;
  final String title;
  final String image;
  final List<String> starList;

  const ReleasFilmEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.starList,
  });

  @override
  List<Object> get props => [id, title, image];
}
