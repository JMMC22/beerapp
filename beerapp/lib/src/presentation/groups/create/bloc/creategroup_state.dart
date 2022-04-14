part of 'creategroup_bloc.dart';

class CreateGroupState extends Equatable {
  final FormzStatus status;
  final List<User> members;
  final List<User> usersSearched;
  final Name name;
  final Price price;

  const CreateGroupState({
    this.status = FormzStatus.pure,
    this.name = const Name.pure(),
    this.price = const Price.pure(),
    this.members = const [],
    this.usersSearched = const [],
  });

  CreateGroupState copyWith({
    FormzStatus? status,
    Name? name,
    Price? price,
    List<User>? members,
    List<User>? usersSearched,
  }) {
    return CreateGroupState(
      status: status ?? this.status,
      name: name ?? this.name,
      price: price ?? this.price,
      members: members ?? this.members,
      usersSearched: usersSearched ?? this.usersSearched,
    );
  }

  @override
  List<Object> get props => [status, name, price, members, usersSearched];
}
