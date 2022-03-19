import 'package:beerapp/src/data/user/models/Group.dart';
import 'package:beerapp/src/data/user/repository/group_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../data/user/models/User.dart';

part 'creategroup_event.dart';
part 'creategroup_state.dart';

class CreategroupBloc extends Bloc<CreategroupEvent, CreategroupState> {
  final GroupRepository _groupRepository;
  CreategroupBloc({required GroupRepository groupRepository})
      : _groupRepository = groupRepository,
        super(CreategroupInitial()) {
    on<CreategroupEvent>(_onCreateGroup);
  }

  void _onCreateGroup(
    CreategroupEvent event,
    Emitter<CreategroupState> emit,
  ) async {
    final String name = event.name;
    final List<User> members = event.members;

    final Group group = Group(
        id: UniqueKey().toString(),
        name: name,
        createdAt: DateTime.now(),
        image: 'image',
        totalAmount: 0.0,
        members: members);
    try {
      await _groupRepository.createGroup(group);
      emit(CreategroupSuccess());
    } catch (e) {
      emit(CreategroupFailure(e.toString()));
    }
  }
}
