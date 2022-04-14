import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:beerapp/src/presentation/groups/details/bloc/bloc/groupdetails_bloc.dart';
import 'package:beerapp/src/presentation/groups/details/widgets/balance_group.dart';
import 'package:beerapp/src/presentation/groups/details/widgets/bar_chart_group.dart';
import 'package:beerapp/src/presentation/groups/details/widgets/members_group_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupDetailsBody extends StatelessWidget {
  const GroupDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailsBloc, GroupDetailsState>(
        builder: (context, state) {
      if (state is GroupDetailsLoading) return const LoadingScreen();
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 75),
            const BarChartGroup(),
            const BalanceGroup(),
            const SizedBox(height: 30),
            MembersGroupList(),
            const SizedBox(height: 70),
          ],
        ),
      );
    });
  }
}
