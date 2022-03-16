import 'package:beerapp/src/data/user/repository/user_repository.dart';
import 'package:beerapp/src/presentation/register/bloc/bloc/register_bloc.dart';
import 'package:beerapp/src/presentation/register/view/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../themes/themes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const Scaffold(
          body: SafeArea(
            child: RegisterBody(),
          ),
        ),
      ),
    );
  }
}
