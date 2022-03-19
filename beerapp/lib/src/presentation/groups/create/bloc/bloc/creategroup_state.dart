part of 'creategroup_bloc.dart';

abstract class CreategroupState extends Equatable {
  const CreategroupState();

  @override
  List<Object> get props => [];
}

class CreategroupInitial extends CreategroupState {}

class CreategroupSuccess extends CreategroupState {}

class CreategroupFailure extends CreategroupState {
  final String error;
  const CreategroupFailure(this.error);

  @override
  List<Object> get props => [error];
}
