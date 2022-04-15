import 'package:beerapp/src/data/consumption/models/consumption.dart';
import 'package:beerapp/src/data/group/models/group.dart';
import 'package:beerapp/src/data/group/repository/group_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../../../data/user/models/user.dart';
import '../../../../../data/user/repository/user_repository.dart';

part 'groupaddspecific_event.dart';
part 'groupaddspecific_state.dart';

class GroupAddSpecificBloc
    extends Bloc<GroupAddSpecificEvent, GroupAddSpecificState> {
  final GroupRepository _groupRepository;
  final UserRepository _userRepository;

  List<Consumption> _consumptions = [];
  Group _group;

  GroupAddSpecificBloc({
    required GroupRepository groupRepository,
    required UserRepository userRepository,
    required Group group,
  })  : _groupRepository = groupRepository,
        _userRepository = userRepository,
        _group = group,
        super(GroupAddSpecificState()) {
    on<GroupAddSpecificEventAddRound>(_onAddRoundToUser);
    on<GroupAddSpecificEventRemoveRound>(_onRemoveRoundToUser);
    on<GroupAddSpecificEventSubmit>(_onSubmit);
  }

  void _onAddRoundToUser(
    GroupAddSpecificEventAddRound event,
    Emitter<GroupAddSpecificState> emit,
  ) async {
    _consumptions.add(_addConsumption(event.user));
    List<Consumption> consumptions = List.from(_consumptions);
    emit(state.copyWith(consumptions: consumptions));
  }

  void _onRemoveRoundToUser(
    GroupAddSpecificEventRemoveRound event,
    Emitter<GroupAddSpecificState> emit,
  ) async {
    var consumption = _consumptions.firstWhere(
        (consumption) => consumption.username == event.user.username);
    _consumptions.remove(consumption);
    List<Consumption> consumptions = List.from(_consumptions);
    emit(state.copyWith(consumptions: consumptions));
  }

  void _onSubmit(
    GroupAddSpecificEventSubmit event,
    Emitter<GroupAddSpecificState> emit,
  ) async {
    emit(state.copyWith(
        status: GroupAddSpecificStateStatus.loading,
        consumptions: _consumptions));

    // Add total consumtions and amout to group
    _group.totalConsumptions += _consumptions.length;
    _group.totalAmount += _consumptions.length * _group.standardPrice;
    try {
      //Add consumptions to users
      for (var consumption in _consumptions) {
        UserItem user = _group.members
            .firstWhere((element) => element.username == consumption.username);
        user.totalConsumptions += 1;
        user.consumptions.add(consumption);
        await _userRepository.addConsumptionToUser(user.id, consumption);
      }
      await _userRepository.updateGroupToUsers(_group);
      await _groupRepository.roundForAllMembers(_group);
      emit(state.copyWith(
          status: GroupAddSpecificStateStatus.success,
          consumptions: _consumptions));
    } catch (_) {
      emit(state.copyWith(
          status: GroupAddSpecificStateStatus.failure,
          consumptions: _consumptions));
    }
  }

  Consumption _addConsumption(UserItem user) {
    return Consumption(
        id: const Uuid().v1(),
        username: user.username,
        createdAt: DateTime.now(),
        amount: _group.standardPrice);
  }
}
