import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:beerapp/src/presentation/groups/create/bloc/creategroup_bloc.dart';
import 'package:beerapp/src/presentation/groups/create/widgets/member_list_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../themes/themes.dart';

class CreateGroupBody extends StatelessWidget {
  TextEditingController searchcontroller = TextEditingController();

  CreateGroupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateGroupBloc, CreateGroupState>(
      listener: (context, state) {
        if (state.status == FormzStatus.submissionSuccess) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<CreateGroupBloc, CreateGroupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                    visible: state.status.isSubmissionFailure ? true : false,
                    child: const ErrorAlert()),
                const GroupNameTextField(),
                const SizedBox(height: 40),
                const GroupPriceTextField(),
                const SizedBox(height: 40),
                Text(
                  'Añadir miembros (${state.members.length})',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color: AppCustomTheme.colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                MemberListSearch(
                    searchController: searchcontroller,
                    searchListenerFuction: () {
                      context
                          .read<CreateGroupBloc>()
                          .add(MembersSearchOnChanged(searchcontroller.text));
                    },
                    users: state.usersSearched),
                const SizedBox(height: 40),
                const SubmitButton(),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GroupPriceTextField extends StatelessWidget {
  const GroupPriceTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupBloc, CreateGroupState>(
      builder: (context, state) {
        return CustomTextField(
          tintText: 'Precio estándar',
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          validator: (value) =>
              context.read<CreateGroupBloc>().add(GroupPriceOnChanged(value)),
          errorText: state.price.invalid ? 'Precio inválido' : null,
        );
      },
    );
  }
}

class GroupNameTextField extends StatelessWidget {
  const GroupNameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupBloc, CreateGroupState>(
      builder: (context, state) {
        return CustomTextField(
          tintText: 'Nombre grupo',
          keyboardType: TextInputType.text,
          validator: (value) =>
              context.read<CreateGroupBloc>().add(GroupNameOnChanged(value)),
          errorText: state.name.invalid ? 'Nombre inválido' : null,
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupBloc, CreateGroupState>(
        builder: (context, state) {
      return CustomButton(
        title: 'Crear',
        onPressed: state.status.isValidated
            ? () => context
                .read<CreateGroupBloc>()
                .add(const SubmittedCreateGroupEvent())
            : null,
      );
    });
  }
}
