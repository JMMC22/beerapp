import 'package:beerapp/src/data/group/models/group.dart';
import 'package:beerapp/src/data/group/repository/group_repository.dart';
import 'package:beerapp/src/data/user/repository/user_repository.dart';
import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/groupaddspecific_bloc.dart';
import 'add_specific_body.dart';

class AddSpecificRoundPage extends StatelessWidget {
  final Group group;
  const AddSpecificRoundPage({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GroupAddSpecificBloc>(
      create: (context) => GroupAddSpecificBloc(
        groupRepository: RepositoryProvider.of<GroupRepository>(context),
        userRepository: RepositoryProvider.of<UserRepository>(context),
        group: group,
      ),
      child: BlocListener<GroupAddSpecificBloc, GroupAddSpecificState>(
        listener: (context, state) {
          if (state.status == GroupAddSpecificStateStatus.success) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppCustomTheme.colors.backgroundGrey,
            leading: IconButton(
              iconSize: 30,
              padding: const EdgeInsets.only(left: 20),
              icon: const Icon(Icons.close_rounded),
              color: AppCustomTheme.colors.black,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            child: AddSpecificRoundBody(
              members: group.members,
            ),
          ),
          bottomNavigationBar: StaticBottomButton(),
        ),
      ),
    );
  }
}

class StaticBottomButton extends StatelessWidget {
  const StaticBottomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupAddSpecificBloc, GroupAddSpecificState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomButton(
              onPressed: state.consumptions.isEmpty
                  ? null
                  : () => BlocProvider.of<GroupAddSpecificBloc>(context)
                      .add(const GroupAddSpecificEventSubmit()),
              title: 'Añadir rondas'),
        );
      },
    );
  }
}
