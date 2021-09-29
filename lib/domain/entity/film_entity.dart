import 'package:equatable/equatable.dart';

class FilmEntity extends Equatable {
  final String id;
  final String title;
  final String image;

  const FilmEntity({
    required this.id,
    required this.title,
    required this.image,
  });

  @override
  List<Object> get props => [id, title, image];
}
