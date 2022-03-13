import 'package:beerapp/src/presentation/navigation/cubit/cubit/navigation_cubit.dart';
import 'package:beerapp/src/presentation/root_page.dart';
import 'package:beerapp/src/routes/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: const MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
