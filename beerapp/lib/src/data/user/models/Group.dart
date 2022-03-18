import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;
  final double totalAmount;

  const Group(
      {required this.id,
      required this.name,
      required this.image,
      required this.createdAt,
      required this.totalAmount});

  factory Group.fromMap(Map<String, dynamic> json) => Group(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      createdAt: DateTime.parse(json["createdAt"].toDate().toString()),
      totalAmount: double.parse(json["totalAmount"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt,
        "totalAmount": totalAmount,
      };

  Group copyWith({id, name, image, createdAt, totalAmount}) => Group(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      totalAmount: totalAmount ?? this.totalAmount);

  @override
  String toString() {
    return "Group with id: $id, username: $name";
  }

  @override
  List<Object?> get props => [id, name, image, createdAt, totalAmount];
}
