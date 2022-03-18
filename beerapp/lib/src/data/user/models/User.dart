import 'package:beerapp/src/data/user/models/Group.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String avatar;
  final DateTime createdAt;
  final List<Group> groups;

  const User({
    required this.id,
    required this.username,
    required this.avatar,
    required this.createdAt,
    required this.groups,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    List<Group> groups = [];
    json["groups"].forEach((group) => groups.add(Group.fromMap(group)));
    return User(
      id: json["id"],
      username: json["username"],
      avatar: json["avatar"],
      createdAt: DateTime.parse(json["createdAt"].toDate().toString()),
      groups: groups,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "avatar": avatar,
        "createdAt": createdAt,
        "groups": List<Group>.from(groups.map((group) => group.toMap())),
      };

  User copyWith({
    id,
    username,
    avatar,
    createdAt,
    groups,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        avatar: avatar ?? this.avatar,
        createdAt: createdAt ?? this.createdAt,
        groups: groups ?? this.groups,
      );

  @override
  String toString() {
    return "User with id: $id, username: $username";
  }

  @override
  List<Object?> get props => [id, username, avatar, createdAt, groups];
}
