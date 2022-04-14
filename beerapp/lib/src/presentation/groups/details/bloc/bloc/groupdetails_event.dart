part of 'groupdetails_bloc.dart';

abstract class GroupDetailsEvent extends Equatable {
  const GroupDetailsEvent();

  @override
  List<Object> get props => [];
}

class GroupDetailsInitialLoad extends GroupDetailsEvent {
  final String id;
  const GroupDetailsInitialLoad(this.id);

  @override
  List<Object> get props => [id];
}

class GroupDetailsRoundForAll extends GroupDetailsEvent {
  const GroupDetailsRoundForAll();

  @override
  List<Object> get props => [];
}
