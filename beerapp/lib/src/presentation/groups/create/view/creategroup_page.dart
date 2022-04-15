import 'package:beerapp/src/data/group/repository/group_repository.dart';
import 'package:beerapp/src/data/user/repository/user_repository.dart';
import 'package:beerapp/src/presentation/groups/create/view/creategroup_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../themes/themes.dart';
import '../bloc/creategroup_bloc.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Crear nuevo grupo',
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
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: RepositoryProvider(
        create: (context) => GroupRepository(),
        child: BlocProvider<CreateGroupBloc>(
          create: (context) => CreateGroupBloc(
              groupRepository: RepositoryProvider.of<GroupRepository>(context),
              userRepository: RepositoryProvider.of<UserRepository>(context))
            ..add(const CreateInitialGroupEvent()),
          child: SingleChildScrollView(
            child: CreateGroupBody(),
          ),
        ),
      ),
    );
  }
}
