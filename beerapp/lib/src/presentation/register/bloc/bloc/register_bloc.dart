import 'package:beerapp/src/data/user/models/user.dart';
import 'package:beerapp/src/data/user/repository/user_repository.dart';
import 'package:beerapp/src/preferences/user_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const RegisterState()) {
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  void _onUsernameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final String username = event.username;
    if (_validateUsername(username)) {
      emit(
        state.copyWith(
            username: username, usernameStatus: UsernameStatus.validated),
      );
    } else {
      if (username.isEmpty) {
        emit(
          state.copyWith(
              username: username, usernameStatus: UsernameStatus.initial),
        );
      } else {
        emit(
          state.copyWith(
              username: username, usernameStatus: UsernameStatus.unvalidated),
        );
      }
    }
  }

  void _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(status: RegisterStatus.inprogress));
    if (await _userRepository.isUsernameAvailable(state.username)) {
      try {
        await _userRepository.registerUser(state.username);
        emit(state.copyWith(status: RegisterStatus.success));
      } catch (_) {
        emit(state.copyWith(status: RegisterStatus.failure));
      }
    } else {
      emit(state.copyWith(
        status: RegisterStatus.failure,
        usernameStatus: UsernameStatus.unvalidated,
      ));
    }
  }

  bool _validateUsername(String username) {
    final RegExp usernameRegex =
        RegExp(r'^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){5,18}[a-zA-Z0-9]$');
    return usernameRegex.hasMatch(username);
  }
}
