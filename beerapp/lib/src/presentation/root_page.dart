import 'package:beerapp/src/presentation/home/view/home_page.dart';
import 'package:beerapp/src/presentation/navigation/constants/nav_bar_items.dart';
import 'package:beerapp/src/presentation/navigation/cubit/cubit/navigation_cubit.dart';
import 'package:beerapp/src/presentation/navigation/widgets/bottom_nav.dart';
import 'package:beerapp/src/presentation/profile/view/profile_page.dart';
import 'package:beerapp/src/presentation/stadistics/view/stadistics_page.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppCustomTheme.colors.backgroundGrey,
        bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return CustomBottomNav(
              currentIndex: state.index,
              onTap: (index) {
                print(index);
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
          },
        ),
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            switch (state.navBarItem) {
              case NavBarItem.home:
                return HomePage();
              case NavBarItem.stadistics:
                return StadisticsPage();
              case NavBarItem.profile:
                return ProfilePage();
            }
          },
        ));
  }
}
