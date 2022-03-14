import 'package:beerapp/src/presentation/navigation/constants/nav_bar_items.dart';
import 'package:beerapp/src/presentation/navigation/cubit/cubit/navigation_cubit.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
      return BottomNavigationBar(
        currentIndex: state.index,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 35,
        selectedItemColor: state.index == 0
            ? AppCustomTheme.colors.bottomNavLightBlue
            : state.index == 1
                ? AppCustomTheme.colors.bottomNavLightYellow
                : AppCustomTheme.colors.bottomNavLightRed,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.house_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Stadistics',
            icon: Icon(
              Icons.bar_chart_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_rounded),
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavBarItem.home);
              break;
            case 1:
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavBarItem.stadistics);
              break;
            case 2:
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavBarItem.profile);
              break;
          }
        },
      );
    });
  }
}
