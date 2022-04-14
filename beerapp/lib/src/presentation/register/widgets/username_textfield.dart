import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons/commons_widgets.dart';
import '../bloc/bloc/register_bloc.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return CustomTextField(
          tintText: 'Nombre de usuario',
          keyboardType: TextInputType.text,
          validator: (username) {
            context.read<RegisterBloc>().add(RegisterUsernameChanged(username));
          },
          errorText: state.usernameStatus == UsernameStatus.unvalidated
              ? 'Nombre de usuario incorrecto.'
              : null,
        );
      },
    );
  }
}
