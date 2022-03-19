part of 'creategroup_bloc.dart';

abstract class CreategroupEvent extends Equatable {
  const CreategroupEvent();

  @override
  List<Object> get props => [];
}

class CreateGroupEvent extends CreategroupEvent {
  final String name;
  final List<User> members;
  const CreateGroupEvent(this.name, this.members);

  @override
  List<Object> get props => [name, members];
}

class GroupNameOnChanged extends CreategroupEvent {
  final String name;
  const GroupNameOnChanged(this.name);

  @override
  List<Object> get props => [name];
}

class MembersSearchOnChanged extends CreategroupEvent {
  final String username;
  const MembersSearchOnChanged(this.username);

  @override
  List<Object> get props => [username];
}
