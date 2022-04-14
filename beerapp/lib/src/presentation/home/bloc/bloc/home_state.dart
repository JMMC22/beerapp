part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final User user;
  final int totalConsumptionsToday;

  const HomeSuccess(this.user, this.totalConsumptionsToday);

  @override
  List<Object> get props => [user];
}

class HomeFailure extends HomeState {
  final String error;

  const HomeFailure(this.error);

  @override
  List<Object> get props => [error];
}
