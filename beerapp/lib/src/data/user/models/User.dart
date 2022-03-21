import 'package:beerapp/src/data/user/models/Group.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String avatar;
  final DateTime createdAt;
  final List<GroupItem> groups;
  final List<String> caseSearch;

  const User({
    required this.id,
    required this.username,
    required this.avatar,
    required this.createdAt,
    required this.groups,
    required this.caseSearch,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      avatar: json["avatar"],
      createdAt: DateTime.parse(json["createdAt"].toDate().toString()),
      groups: List<GroupItem>.from(
          json["groups"].map((group) => GroupItem.fromMap(group))),
      caseSearch: List<String>.from(json["caseSearch"].map((value) => value)),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "avatar": avatar,
        "createdAt": createdAt,
        "groups": groups.map((group) => group.toMap()).toList(),
        "caseSearch": caseSearch.map((e) => e).toList(),
      };

  User copyWith({
    id,
    username,
    avatar,
    createdAt,
    groups,
    caseSearch,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        avatar: avatar ?? this.avatar,
        createdAt: createdAt ?? this.createdAt,
        groups: groups ?? this.groups,
        caseSearch: caseSearch ?? this.caseSearch,
      );

  @override
  String toString() {
    return "User with id: $id, username: $username";
  }

  @override
  List<Object?> get props =>
      [id, username, avatar, createdAt, groups, caseSearch];
}

class GroupItem {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;
  final double totalAmount;

  const GroupItem({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.totalAmount,
  });

  factory GroupItem.fromMap(Map<String, dynamic> json) {
    return GroupItem(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      createdAt: DateTime.parse(json["createdAt"].toDate().toString()),
      totalAmount: double.parse(json["totalAmount"].toString()),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt,
        "totalAmount": totalAmount,
      };

  GroupItem copyWith({id, name, image, createdAt, totalAmount}) => GroupItem(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        totalAmount: totalAmount ?? this.totalAmount,
      );

  @override
  String toString() {
    return "GroupItem with id: $id, username: $name";
  }

  @override
  List<Object?> get props => [id, name, image, createdAt, totalAmount];
}
