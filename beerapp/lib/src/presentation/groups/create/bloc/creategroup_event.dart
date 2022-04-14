part of 'creategroup_bloc.dart';

abstract class CreateGroupEvent extends Equatable {
  const CreateGroupEvent();

  @override
  List<Object> get props => [];
}

class CreateInitialGroupEvent extends CreateGroupEvent {
  const CreateInitialGroupEvent();
  @override
  List<Object> get props => [];
}

class SubmittedCreateGroupEvent extends CreateGroupEvent {
  const SubmittedCreateGroupEvent();

  @override
  List<Object> get props => [];
}

class GroupNameOnChanged extends CreateGroupEvent {
  final String name;
  const GroupNameOnChanged(this.name);

  @override
  List<Object> get props => [name];
}

class GroupPriceOnChanged extends CreateGroupEvent {
  final String price;
  const GroupPriceOnChanged(this.price);

  @override
  List<Object> get props => [price];
}

class MembersSearchOnChanged extends CreateGroupEvent {
  final String username;
  const MembersSearchOnChanged(this.username);

  @override
  List<Object> get props => [username];
}

class AddMember extends CreateGroupEvent {
  final User user;
  const AddMember(this.user);

  @override
  List<Object> get props => [user];
}

class RemoveMember extends CreateGroupEvent {
  final User user;
  const RemoveMember(this.user);

  @override
  List<Object> get props => [user];
}
