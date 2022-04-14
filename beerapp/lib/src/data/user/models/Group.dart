import 'package:beerapp/src/data/user/models/Consumption.dart';
import 'package:equatable/equatable.dart';

class Group extends Equatable {
  String id;
  String name;
  String image;
  DateTime createdAt;
  double standardPrice;
  double totalAmount;
  int totalConsumptions;
  List<UserItem> members;

  Group({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.standardPrice,
    required this.totalAmount,
    required this.totalConsumptions,
    required this.members,
  });

  factory Group.fromMap(Map<String, dynamic> json) {
    return Group(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      createdAt: DateTime.parse(json["createdAt"].toDate().toString()),
      standardPrice: double.parse(json["standardPrice"].toString()),
      totalAmount: double.parse(json["totalAmount"].toString()),
      totalConsumptions: json["totalConsumptions"],
      members: List<UserItem>.from(
          json["members"].map((user) => UserItem.fromMap(user))),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt,
        "standardPrice": standardPrice,
        "totalAmount": totalAmount,
        "totalConsumptions": totalConsumptions,
        "members": members.map((user) => user.toMap()).toList(),
      };

  Group copyWith(
          {id,
          name,
          image,
          createdAt,
          standardPrice,
          totalAmount,
          members,
          totalConsumptions}) =>
      Group(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        standardPrice: standardPrice ?? this.standardPrice,
        totalAmount: totalAmount ?? this.totalAmount,
        totalConsumptions: totalConsumptions ?? this.totalConsumptions,
        members: members ?? this.members,
      );

  @override
  String toString() {
    return "Group with id: $id, username: $name";
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        createdAt,
        standardPrice,
        totalAmount,
        members,
        totalConsumptions
      ];
}

class UserItem {
  final String id;
  final String username;
  final String avatar;
  double totalAmount;
  int totalConsumptions;
  List<Consumption> consumptions;

  UserItem(
      {required this.id,
      required this.username,
      required this.avatar,
      required this.totalAmount,
      required this.totalConsumptions,
      required this.consumptions});

  factory UserItem.fromMap(Map<String, dynamic> json) {
    return UserItem(
        id: json["id"],
        username: json["username"],
        avatar: json["avatar"],
        totalAmount: double.parse(json["totalAmount"].toString()),
        totalConsumptions: json["totalConsumptions"],
        consumptions: List<Consumption>.from(json["consumptions"]
            .map((consumption) => Consumption.fromMap(consumption))));
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "avatar": avatar,
        "totalConsumptions": totalConsumptions,
        "totalAmount": totalAmount,
        "consumptions":
            consumptions.map((consumption) => consumption.toMap()).toList()
      };
}
