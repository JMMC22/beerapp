import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../preferences/user_preferences.dart';
import '../models/User.dart';

abstract class IUserRepository {
  Future<void> registerUser(String username);
  Future<void> updateUser(User user);
  Future<void> getUserById(String id);
  Future<bool> isUsernameAvailable(String username);
}

class UserRepository implements IUserRepository {
  final _userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Future<void> getUserById(String id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  /// Register user
  @override
  Future<void> registerUser(String username) async {
    log('Registering user');

    User user = User(
      id: UniqueKey().toString(),
      username: username,
      avatar: "",
      createdAt: DateTime.now(),
    );

    await _userCollection
        .doc(user.id)
        .set(user.toMap())
        .catchError((error) => log(error));

    await UserPreferences.setUserId(user.id);

    log('Registered user');
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isUsernameAvailable(String username) async {
    var user = await _userCollection
        .where('username', isEqualTo: username.toLowerCase())
        .get();
    if (user.docs.isEmpty) return true;
    return false;
  }
}
