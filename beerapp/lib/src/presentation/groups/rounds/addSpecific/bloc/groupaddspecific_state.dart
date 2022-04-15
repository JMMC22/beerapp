part of 'groupaddspecific_bloc.dart';

enum GroupAddSpecificStateStatus { initial, loading, success, failure }

class GroupAddSpecificState extends Equatable {
  final List<Consumption> consumptions;
  final GroupAddSpecificStateStatus status;

  const GroupAddSpecificState({
    this.consumptions = const [],
    this.status = GroupAddSpecificStateStatus.initial,
  });

  GroupAddSpecificState copyWith({
    List<Consumption>? consumptions,
    GroupAddSpecificStateStatus? status,
  }) {
    return GroupAddSpecificState(
      consumptions: consumptions ?? this.consumptions,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [consumptions, status];
}
