import 'package:beerapp/src/data/user/models/Consumption.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../../../data/user/models/Group.dart';
import '../../../../../data/user/repository/group_repository.dart';
import '../../../../../data/user/repository/user_repository.dart';

part 'groupdetails_event.dart';
part 'groupdetails_state.dart';

class GroupDetailsBloc extends Bloc<GroupDetailsEvent, GroupDetailsState> {
  final GroupRepository _groupRepository;
  final UserRepository _userRepository;

  late Group _group;

  GroupDetailsBloc({
    required GroupRepository groupRepository,
    required UserRepository userRepository,
  })  : _groupRepository = groupRepository,
        _userRepository = userRepository,
        super(GroupDetailsInitial()) {
    on<GroupDetailsInitialLoad>(_onLoadGroup);
    on<GroupDetailsRoundForAll>(_onAddRoundForAll);
  }

  void _onLoadGroup(
    GroupDetailsInitialLoad event,
    Emitter<GroupDetailsState> emit,
  ) async {
    emit(GroupDetailsLoading());

    _group = await _groupRepository.getGroupById(event.id);

    emit(GroupDetailsLoaded(_group));
  }

  void _onAddRoundForAll(
    GroupDetailsRoundForAll event,
    Emitter<GroupDetailsState> emit,
  ) async {
    _group.totalConsumptions += _group.members.length;
    for (var user in _group.members) {
      user.totalConsumptions += 1;
      Consumption consumption = Consumption(
          id: const Uuid().v1(),
          username: user.username,
          createdAt: DateTime.now(),
          amount: 0.0);
      user.consumptions.add(consumption);
      await _userRepository.addConsumptionToUser(user.id, consumption);
    }
    await _groupRepository.roundForAllMembers(_group);
    _group = await _groupRepository.getGroupById(_group.id);
    emit(GroupDetailsLoaded(_group));
  }
}
