import 'package:equatable/equatable.dart';

class ActorEntity extends Equatable {
  final String id;
  final String image;
  final String name;
  const ActorEntity({
    required this.id,
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [id, image, name];
}
