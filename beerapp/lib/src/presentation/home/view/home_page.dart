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
          create: (context) => HomeBloc(),
          child: const HomeBody(),
        ),
      ),
    );
  }
}
