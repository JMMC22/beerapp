import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:beerapp/src/presentation/groups/create/bloc/bloc/creategroup_bloc.dart';
import 'package:beerapp/src/presentation/groups/create/widgets/member_list_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../themes/themes.dart';

class CreateGroupBody extends StatelessWidget {
  TextEditingController searchcontroller = TextEditingController();

  CreateGroupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = "";
    return BlocListener<CreategroupBloc, CreategroupState>(
      listener: (context, state) {
        if (state is CreategroupSuccess) Navigator.pop(context);
      },
      child: BlocBuilder<CreategroupBloc, CreategroupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                    tintText: 'Nombre grupo',
                    validator: (value) => name = value),
                const SizedBox(height: 40),
                Text(
                  'Añadir miembros',
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
                ),
                const SizedBox(height: 40),
                CustomButton(
                    title: 'Crear',
                    onPressed: () => context
                        .read<CreategroupBloc>()
                        .add(CreategroupEvent(name, [])))
              ],
            ),
          );
        },
      ),
    );
  }
}
