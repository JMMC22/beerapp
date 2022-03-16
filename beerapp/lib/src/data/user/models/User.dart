import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String avatar;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.username,
    required this.avatar,
    required this.createdAt,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        avatar: json["avatar"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "avatar": avatar,
        "createdAt": createdAt,
      };

  User copyWith({
    id,
    username,
    avatar,
    createdAt,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        avatar: avatar ?? this.avatar,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  String toString() {
    return "User with id: $id, username: $username";
  }

  @override
  List<Object?> get props => [id, username, avatar, createdAt];
}
