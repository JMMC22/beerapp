import 'package:beerapp/src/presentation/home/view/home_page.dart';
import 'package:beerapp/src/presentation/navigation/constants/nav_bar_items.dart';
import 'package:beerapp/src/presentation/navigation/cubit/cubit/navigation_cubit.dart';
import 'package:beerapp/src/presentation/navigation/widgets/bottom_nav_bar.dart';
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
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            switch (state.navBarItem) {
              case NavBarItem.home:
                return const HomePage();
              case NavBarItem.stadistics:
                return const StadisticsPage();
              case NavBarItem.profile:
                return const ProfilePage();
            }
          },
        ));
  }
}
