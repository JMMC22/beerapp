part of 'creategroup_bloc.dart';

class CreategroupEvent extends Equatable {
  final String name;
  final List<User> members;
  const CreategroupEvent(this.name, this.members);

  @override
  List<Object> get props => [name, members];
}
