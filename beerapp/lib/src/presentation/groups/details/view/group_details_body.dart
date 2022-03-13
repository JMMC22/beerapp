import 'package:beerapp/src/presentation/groups/details/widgets/balance_group.dart';
import 'package:beerapp/src/presentation/groups/details/widgets/members_group_list.dart';
import 'package:flutter/material.dart';

class GroupDetailsBody extends StatelessWidget {
  const GroupDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 290),
          BalanceGroup(),
          const SizedBox(height: 30),
          MembersGroupList(),
        ],
      ),
    );
  }
}
