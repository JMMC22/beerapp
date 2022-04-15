import 'dart:developer';

import 'package:beerapp/src/data/consumption/models/consumption.dart';
import 'package:beerapp/src/data/group/models/group.dart';
import 'package:beerapp/src/data/user/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../preferences/user_preferences.dart';

abstract class IUserRepository {
  Future<void> registerUser(String username);
  Future<void> updateUser(User user);
  Future<User> getUserById(String id);
  Future<List<User>> getUserByUsername(String username);
  Future<bool> isUsernameAvailable(String username);
  Future<void> addGroupToUsers(List<User> members, Group group);
  Future<void> addConsumptionToUser(String id, Consumption consumption);
  Future<void> deleteGroupByUser(String userId, GroupItem group);
  Future<void> updateGroupToUsers(Group group);
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
      id: const Uuid().v1(),
      username: username,
      avatar: "",
      createdAt: DateTime.now(),
      groups: const [],
      caseSearch: setSearchParam(username),
      consumptions: const [],
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

  @override
  Future<void> updateGroupToUsers(Group group) async {
    var client = FirebaseFirestore.instance.batch();

    GroupItem groupItem = GroupItem(
        id: group.id,
        name: group.name,
        image: group.image,
        createdAt: group.createdAt,
        totalAmount: group.totalAmount);

    for (var user in group.members) {
      User databaseUser = await getUserById(user.id);
      databaseUser.groups
          .firstWhere((element) => element.id == group.id)
          .totalAmount = group.totalAmount;

      client.update(_userCollection.doc(user.id), databaseUser.toMap());
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

  @override
  Future<void> deleteGroupByUser(String userId, GroupItem group) async {
    return await _userCollection.doc(userId).update({
      'groups': FieldValue.arrayRemove([group.toMap()])
    }).catchError(
      (error) {
        log(error.toString());
      },
    );
  }
}
