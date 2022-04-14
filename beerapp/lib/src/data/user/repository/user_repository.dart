import 'dart:developer';

import 'package:beerapp/src/data/user/models/Consumption.dart';
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
  Future<List<User>> getUserByUsername(String username);
  Future<bool> isUsernameAvailable(String username);
  Future<void> addGroupToUsers(List<User> members, Group group);
  Future<void> addConsumptionToUser(String id, Consumption consumption);
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
      groups: [],
      caseSearch: setSearchParam(username),
      consumptions: [],
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

  @override
  Future<void> addGroupToUsers(List<User> members, Group group) async {
    var client = FirebaseFirestore.instance.batch();

    GroupItem groupItem = GroupItem(
        id: group.id,
        name: group.name,
        image: group.image,
        createdAt: group.createdAt,
        totalAmount: group.totalAmount);

    for (var user in members) {
      client.update(_userCollection.doc(user.id), {
        'groups': FieldValue.arrayUnion([groupItem.toMap()])
      });
    }
    client.commit();
  }

  // TODO: CLEAN
  // Fuction to save username partly
  List<String> setSearchParam(String username) {
    List<String> caseSearchList = List.empty(growable: true);
    String temp = "";
    for (int i = 0; i < username.length; i++) {
      temp = temp + username[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }

  @override
  Future<List<User>> getUserByUsername(String username) async {
    log('Get user by username');
    List<User> users = [];
    await _userCollection
        .where('caseSearch', arrayContains: username)
        .get()
        .then((value) {
      for (var element in value.docs) {
        users.add(User.fromMap(element.data()));
      }
    }).catchError(
      (error) {
        log(error.toString());
      },
    );
    return users;
  }

  @override
  Future<void> addConsumptionToUser(String id, Consumption consumption) async {
    return await _userCollection.doc(id).update({
      'consumptions': FieldValue.arrayUnion([consumption.toMap()])
    }).catchError(
      (error) {
        log(error.toString());
      },
    );
  }
}
