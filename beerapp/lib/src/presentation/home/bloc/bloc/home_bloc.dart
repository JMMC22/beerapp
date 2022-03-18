import 'package:beerapp/src/data/user/repository/user_repository.dart';
import 'package:beerapp/src/preferences/user_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/user/models/User.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository _userRepository;
  HomeBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(HomeLoading()) {
    on<HomeLoad>(_fetchHomePage);
  }

  void _fetchHomePage(
    HomeLoad event,
    Emitter<HomeState> emit,
  ) async {
    try {
      var id = await UserPreferences.getUserId();
      User user = await _userRepository.getUserById(id!);
      emit(HomeSuccess(user));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
