import 'package:beerapp/src/presentation/navigation/constants/nav_bar_items.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(NavBarItem.home, 0)); // Initial state

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(const NavigationState(NavBarItem.home, 0));
        break;
      case NavBarItem.stadistics:
        emit(const NavigationState(NavBarItem.stadistics, 1));
        break;
      case NavBarItem.profile:
        emit(const NavigationState(NavBarItem.profile, 2));
        break;
    }
  }
}
