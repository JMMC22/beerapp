import 'package:beerapp/src/data/user/models/User.dart';
import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;
  final double totalAmount;
  final List<User> members;

  const Group(
      {required this.id,
      required this.name,
      required this.image,
      required this.createdAt,
      required this.totalAmount,
      required this.members});

  factory Group.fromMap(Map<String, dynamic> json) {
    List<User> members = [];
    json["members"].forEach((user) => members.add(User.fromMap(user)));
    return Group(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      createdAt: DateTime.parse(json["createdAt"].toDate().toString()),
      totalAmount: double.parse(json["totalAmount"]),
      members: members,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt,
        "totalAmount": totalAmount,
        "members": List<User>.from(members.map((user) => user.toMap())),
      };

  Group copyWith({id, name, image, createdAt, totalAmount, members}) => Group(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        totalAmount: totalAmount ?? this.totalAmount,
        members: members ?? this.members,
      );

  @override
  String toString() {
    return "Group with id: $id, username: $name";
  }

  @override
  List<Object?> get props => [id, name, image, createdAt, totalAmount, members];
}
