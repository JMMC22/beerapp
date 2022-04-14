import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/commons_widgets.dart';
import '../bloc/bloc/register_bloc.dart';

class EnterButton extends StatelessWidget {
  const EnterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return state.status == RegisterStatus.inprogress
            ? const CustomButton(title: 'Cargando...', onPressed: null)
            : CustomButton(
                title: 'Entrar',
                onPressed: state.usernameStatus == UsernameStatus.validated
                    ? () => context
                        .read<RegisterBloc>()
                        .add(const RegisterSubmitted())
                    : null);
      },
    );
  }
}
