import '../../domain/domain.dart';

class ActorModel extends ActorEntity {
  ActorModel({
    required String id,
    required String image,
    required String name,
  }) : super(id: id, image: image, name: name);

  factory ActorModel.fromMap(Map<String, dynamic> map) {
    return ActorModel(
      id: map["id"] ?? "0000",
      image: map["image"] ?? "",
      name: map["name"] ?? "Sem nome",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "image": image,
      "name": name,
    };
  }
}
