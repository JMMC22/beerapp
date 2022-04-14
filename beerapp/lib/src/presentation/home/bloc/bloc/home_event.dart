part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoad extends HomeEvent {
  const HomeLoad();
}

class HomeLeaveGroupLoad extends HomeEvent {
  final GroupItem group;
  const HomeLeaveGroupLoad(this.group);
}
