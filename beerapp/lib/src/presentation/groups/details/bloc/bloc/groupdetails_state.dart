part of 'groupdetails_bloc.dart';

abstract class GroupDetailsState extends Equatable {
  const GroupDetailsState();

  @override
  List<Object> get props => [];
}

class GroupDetailsInitial extends GroupDetailsState {}

class GroupDetailsLoading extends GroupDetailsState {}

class GroupDetailsLoaded extends GroupDetailsState {
  final Group group;
  const GroupDetailsLoaded(this.group);

  @override
  List<Object> get props => [group];
}
