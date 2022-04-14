import 'package:beerapp/src/data/user/models/Consumption.dart';
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
      user.groups.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      emit(HomeSuccess(
          user, _getTotalConsumptionsToday(user), _getTotalAmountToday(user)));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  int _getTotalConsumptionsToday(User user) {
    return _getTodayConsumptions(user).length;
  }

  double _getTotalAmountToday(User user) {
    return _getTodayConsumptions(user)
        .fold(0.0, (previousValue, element) => previousValue + element.amount);
  }

  List<Consumption> _getTodayConsumptions(User user) {
    return user.consumptions
        .where((consumption) =>
            DateTime(consumption.createdAt.year, consumption.createdAt.month,
                consumption.createdAt.day) ==
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .toList();
  }
}
