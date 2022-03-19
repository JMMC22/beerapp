import 'dart:developer';

import 'package:beerapp/src/data/user/models/Group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IGroupRepository {
  Future<void> createGroup(Group group);
  Future<void> updateGroupr(Group group);
  Future<void> deleteGroup(String id);
}

class GroupRepository extends IGroupRepository {
  final _groupCollection = FirebaseFirestore.instance.collection("groups");

  @override
  Future<void> createGroup(Group group) async {
    log('Create group.');

    await _groupCollection
        .doc(group.id)
        .set(group.toMap())
        .catchError((error) => log(error));

    log('Group created.');
  }

  @override
  Future<void> deleteGroup(String id) {
    // TODO: implement deleteGroup
    throw UnimplementedError();
  }

  @override
  Future<void> updateGroupr(Group group) {
    // TODO: implement updateGroupr
    throw UnimplementedError();
  }
}
