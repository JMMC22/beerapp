import 'package:beerapp/src/data/user/models/Group.dart';
import 'package:beerapp/src/data/user/repository/group_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../data/user/models/User.dart';
import '../../../../../data/user/repository/user_repository.dart';
import '../../../../../preferences/user_preferences.dart';

part 'creategroup_event.dart';
part 'creategroup_state.dart';

class CreategroupBloc extends Bloc<CreategroupEvent, CreategroupState> {
  final GroupRepository _groupRepository;
  final UserRepository _userRepository;
  CreategroupBloc({
    required GroupRepository groupRepository,
    required UserRepository userRepository,
  })  : _groupRepository = groupRepository,
        _userRepository = userRepository,
        super(CreategroupInitial()) {
    on<CreateGroupEvent>(_onCreateGroup);
    on<GroupNameOnChanged>(_nameOnchanged);
  }

  void _onCreateGroup(
    CreateGroupEvent event,
    Emitter<CreategroupState> emit,
  ) async {
    final String name = event.name;
    final List<User> members = event.members;

    members.add(await _getLoggedUser()); // Add current user
    final Group group = Group(
        id: Uuid().v1(),
        name: name,
        createdAt: DateTime.now(),
        image: 'image',
        totalAmount: 0.0,
        members: List<UserItem>.from(members.map((user) =>
            UserItem(id: user.id, totalAmount: 0.0, totalConsumptions: 0))));
    try {
      await _groupRepository.createGroup(group);
      await _userRepository.addGroupToUsers(members, group);

      emit(CreategroupSuccess());
    } catch (e) {
      emit(CreategroupFailure(e.toString()));
    }
  }

  Future<User> _getLoggedUser() async {
    var id = await UserPreferences.getUserId();
    User user = await _userRepository.getUserById(id!);
    return user;
  }

  void _nameOnchanged(
      GroupNameOnChanged event, Emitter<CreategroupState> emit) {
    if (event.name.isEmpty || event.name.length < 4) {
      emit(const CreategroupNameUnvalidate('Nombre de grupo no válido.'));
    } else {
      emit(CreategroupNameValidate(event.name));
    }
  }
}
