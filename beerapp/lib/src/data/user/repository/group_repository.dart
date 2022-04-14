import 'dart:developer';

import 'package:beerapp/src/data/user/models/Group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IGroupRepository {
  Future<void> createGroup(Group group);
  Future<void> updateGroup(Group group);
  Future<void> deleteGroup(String id);
  Future<Group> getGroupById(String id);
  Future<void> roundForAllMembers(Group group);
}

class GroupRepository extends IGroupRepository {
  final _groupCollection = FirebaseFirestore.instance.collection("groups");

  @override
  Future<void> createGroup(Group group) async {
    log('Create group.');

    await _groupCollection
        .doc(group.id)
        .set(group.toMap())
        .then((value) => log('Group created.'))
        .catchError(
          (error) => log(error.toString()),
        );
  }

  @override
  Future<void> deleteGroup(String id) {
    // TODO: implement deleteGroup
    throw UnimplementedError();
  }

  @override
  Future<void> updateGroup(Group group) {
    // TODO: implement updateGroupr
    throw UnimplementedError();
  }

  @override
  Future<Group> getGroupById(String id) async {
    log('Get group with id: $id');
    return await _groupCollection
        .doc(id)
        .get()
        .then((value) => Group.fromMap(value.data()!))
        .catchError(
      (error) {
        log(error.toString());
      },
    );
  }

  @override
  Future<void> roundForAllMembers(Group group) async {
    return await _groupCollection
        .doc(group.id)
        .update(group.toMap())
        .catchError(
      (error) {
        log(error.toString());
      },
    );
  }
}
