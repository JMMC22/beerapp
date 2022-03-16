import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:beerapp/src/presentation/register/bloc/bloc/register_bloc.dart';
import 'package:beerapp/src/presentation/root_page.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/register_widgets.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const RootPage()),
              (route) => false);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Bienvenido!',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: AppCustomTheme.colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Para comenzar a utilizar la app necesitamos un nombre de usuario',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: AppCustomTheme.colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                const UsernameTextField(),
                const SizedBox(height: 25),
                const EnterButton()
              ],
            ),
          );
        },
      ),
    );
  }
}
