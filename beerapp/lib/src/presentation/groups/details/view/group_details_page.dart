import 'package:beerapp/src/data/user/repository/user_repository.dart';
import 'package:beerapp/src/presentation/groups/details/bloc/bloc/groupdetails_bloc.dart';
import 'package:beerapp/src/presentation/groups/details/view/group_details_body.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/user/models/Group.dart';
import '../../../../data/user/models/User.dart';
import '../../../../data/user/repository/group_repository.dart';
import '../../../commons/commons_widgets.dart';

class GroupDetailsPage extends StatelessWidget {
  final GroupItem group;
  const GroupDetailsPage({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GroupRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GroupDetailsBloc>(
            create: (context) => GroupDetailsBloc(
                groupRepository:
                    RepositoryProvider.of<GroupRepository>(context),
                userRepository: RepositoryProvider.of<UserRepository>(context))
              ..add(
                GroupDetailsInitialLoad(group.id),
              ),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              group.name,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: AppCustomTheme.colors.black,
              ),
            ),
            backgroundColor: AppCustomTheme.colors.backgroundGrey,
            leading: IconButton(
              iconSize: 30,
              padding: const EdgeInsets.only(left: 20),
              icon: const Icon(Icons.arrow_back_ios),
              color: AppCustomTheme.colors.black,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: const GroupDetailsBody(),
          floatingActionButton: const FloatActionButtonRounds(),
        ),
      ),
    );
  }
}

class FloatActionButtonRounds extends StatelessWidget {
  const FloatActionButtonRounds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppCustomTheme.colors.lightGrey,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage('assets/icons/beer_plus_white.png'),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: AppCustomTheme.colors.backgroundGrey,
          context: context,
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 25, right: 15, bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                      title: 'Añadir ronda para todos',
                      onPressed: () {
                        BlocProvider.of<GroupDetailsBloc>(context)
                            .add(const GroupDetailsRoundForAll());
                        Navigator.pop(context);
                      }),
                  const Divider(height: 10),
                  const CustomButton(
                      title: 'Seleccionar a quién añadir ronda',
                      onPressed: null),
                  const Divider(height: 10),
                  const CustomButton(
                      title: 'Cambiar precio estándar', onPressed: null),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
