part of 'register_bloc.dart';

enum UsernameStatus { validated, unvalidated, initial }
enum RegisterStatus { success, failure, initial, inprogress }

class RegisterState extends Equatable {
  final String username;
  final RegisterStatus status;
  final UsernameStatus usernameStatus;

  const RegisterState({
    this.username = "",
    this.status = RegisterStatus.initial,
    this.usernameStatus = UsernameStatus.initial,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    String? username,
    UsernameStatus? usernameStatus,
  }) {
    return RegisterState(
      status: status ?? this.status,
      username: username ?? this.username,
      usernameStatus: usernameStatus ?? this.usernameStatus,
    );
  }

  @override
  List<Object> get props => [status, username, usernameStatus];
}
