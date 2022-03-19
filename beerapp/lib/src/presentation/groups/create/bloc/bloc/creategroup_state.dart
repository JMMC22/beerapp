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

class CreategroupNameValidate extends CreategroupState {
  final String name;
  const CreategroupNameValidate(this.name);

  @override
  List<Object> get props => [name];
}

class CreategroupNameUnvalidate extends CreategroupState {
  final String error;
  const CreategroupNameUnvalidate(this.error);

  @override
  List<Object> get props => [error];
}
