import 'package:equatable/equatable.dart';

class Consumption extends Equatable {
  final String id;
  final String username;
  final DateTime createdAt;
  final double amount;

  const Consumption({
    required this.id,
    required this.username,
    required this.createdAt,
    required this.amount,
  });

  factory Consumption.fromMap(Map<String, dynamic> json) {
    return Consumption(
      id: json["id"],
      username: json["username"],
      amount: double.parse(json["amount"].toString()),
      createdAt: DateTime.parse(json["createdAt"].toDate().toString()),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "amount": amount,
        "createdAt": createdAt,
      };

  Consumption copyWith({
    id,
    username,
    amount,
    createdAt,
  }) =>
      Consumption(
        id: id ?? this.id,
        username: username ?? this.username,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  String toString() {
    return "Consumption with id: $id, username: $username";
  }

  @override
  List<Object?> get props => [id, username, createdAt, amount];
}
