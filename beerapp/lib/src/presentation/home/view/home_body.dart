import 'package:beerapp/src/presentation/home/bloc/bloc/home_bloc.dart';
import 'package:beerapp/src/presentation/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/commons_widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const LoadingScreen();
        } else if (state is HomeSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                HeaderHome(
                  username: state.user.username,
                ),
                const SizedBox(height: 30),
                const BalanceOverviewHome(),
                const SizedBox(height: 30),
                GroupListHome(
                  groups: state.user.groups,
                ),
              ],
            ),
          );
        }

        return const ErrorAlert();
      },
    );
  }
}
