import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;
  final double totalAmount;
  final List<UserItem> members;

  const Group({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.totalAmount,
    required this.members,
  });

  factory Group.fromMap(Map<String, dynamic> json) {
    return Group(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      createdAt: DateTime.parse(json["createdAt"].toDate().toString()),
      totalAmount: double.parse(json["totalAmount"].toString()),
      members: List<UserItem>.from(
          json["members"].map((user) => UserItem.fromMap(user))),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt,
        "totalAmount": totalAmount,
        "members": members.map((user) => user.toMap()).toList(),
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

class UserItem {
  final String id;
  final double totalAmount;
  final int totalConsumptions;

  UserItem({
    required this.id,
    required this.totalAmount,
    required this.totalConsumptions,
  });

  factory UserItem.fromMap(Map<String, dynamic> json) {
    return UserItem(
      id: json["id"],
      totalAmount: double.parse(json["totalAmount"].toString()),
      totalConsumptions: json["totalConsumptions"],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "totalConsumptions": totalConsumptions,
        "totalAmount": totalAmount,
      };
}
