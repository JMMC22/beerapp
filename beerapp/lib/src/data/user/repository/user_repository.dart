import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../preferences/user_preferences.dart';
import '../models/Group.dart';
import '../models/User.dart';

abstract class IUserRepository {
  Future<void> registerUser(String username);
  Future<void> updateUser(User user);
  Future<User> getUserById(String id);
  Future<bool> isUsernameAvailable(String username);
  Future<void> addGroupToUsers(List<User> members, Group group);
}

class UserRepository implements IUserRepository {
  final _userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Future<User> getUserById(String id) async {
    log('Get user');
    return await _userCollection
        .doc(id)
        .get()
        .then((value) => User.fromMap(value.data()!))
        .catchError(
      (error) {
        log(error.toString());
      },
    );
  }

  /// Register user
  @override
  Future<void> registerUser(String username) async {
    log('Registering user');
    User user = User(
        id: Uuid().v1(),
        username: username,
        avatar: "",
        createdAt: DateTime.now(),
        groups: []);

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

  @override
  Future<void> addGroupToUsers(List<User> members, Group group) async {
    var client = FirebaseFirestore.instance.batch();
    members.forEach((user) {
      client.update(_userCollection.doc(user.id), {
        'groups': FieldValue.arrayUnion([group.toMap()])
      });
    });
    client.commit();
    /*await _userCollection.doc(user.id).update({
      "groups": FieldValue.arrayUnion([group.toMap()])
    }).catchError((error) {
      log(error.toString());
    });*/
  }
}
