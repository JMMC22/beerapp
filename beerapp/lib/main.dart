import 'package:beerapp/src/preferences/user_preferences.dart';
import 'package:beerapp/src/presentation/navigation/cubit/cubit/navigation_cubit.dart';
import 'package:beerapp/src/presentation/root_page.dart';
import 'package:beerapp/src/routes/router_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/data/user/repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? isLogged = await UserPreferences.getUserId();

  runApp(MyApp(
    userRepository: UserRepository(),
    initialRoute: isLogged != null ? '/' : '/register',
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final String initialRoute;

  const MyApp({
    Key? key,
    required this.userRepository,
    required this.initialRoute,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: userRepository,
      child: BlocProvider<NavigationCubit>(
        create: (context) => NavigationCubit(),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: MaterialApp(
            initialRoute: initialRoute,
            onGenerateRoute: RouterGenerator.generateRoute,
          ),
        ),
      ),
    );
  }
}
