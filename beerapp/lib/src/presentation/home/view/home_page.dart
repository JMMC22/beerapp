import 'package:beerapp/src/data/group/repository/group_repository.dart';
import 'package:beerapp/src/data/user/repository/user_repository.dart';
import 'package:beerapp/src/presentation/home/bloc/bloc/home_bloc.dart';
import 'package:beerapp/src/presentation/home/view/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
              groupRepository: RepositoryProvider.of<GroupRepository>(context))
            ..add(const HomeLoad()),
          child: const HomeBody(),
        ),
      ),
    );
  }
}
