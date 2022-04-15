part of 'groupaddspecific_bloc.dart';

abstract class GroupAddSpecificEvent extends Equatable {
  const GroupAddSpecificEvent();

  @override
  List<Object> get props => [];
}

class GroupAddSpecificEventLoad extends GroupAddSpecificEvent {
  final List<User> members;
  const GroupAddSpecificEventLoad(this.members);

  @override
  List<Object> get props => [members];
}

class GroupAddSpecificEventAddRound extends GroupAddSpecificEvent {
  final UserItem user;
  const GroupAddSpecificEventAddRound(this.user);

  @override
  List<Object> get props => [user];
}

class GroupAddSpecificEventRemoveRound extends GroupAddSpecificEvent {
  final UserItem user;
  const GroupAddSpecificEventRemoveRound(this.user);

  @override
  List<Object> get props => [user];
}

class GroupAddSpecificEventSubmit extends GroupAddSpecificEvent {
  const GroupAddSpecificEventSubmit();

  @override
  List<Object> get props => [];
}
