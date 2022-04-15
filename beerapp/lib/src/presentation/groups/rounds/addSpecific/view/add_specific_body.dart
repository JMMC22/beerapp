import 'package:beerapp/src/data/group/models/group.dart';
import 'package:beerapp/src/presentation/groups/rounds/addSpecific/bloc/groupaddspecific_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../themes/themes.dart';

class AddSpecificRoundBody extends StatefulWidget {
  final List<UserItem> members;
  AddSpecificRoundBody({Key? key, required this.members}) : super(key: key);

  @override
  State<AddSpecificRoundBody> createState() => _AddSpecificRoundBodyState();
}

class _AddSpecificRoundBodyState extends State<AddSpecificRoundBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 25),
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: widget.members.length,
        itemBuilder: (context, index) {
          return UserItemListSpecific(
            index: index,
            users: widget.members,
          );
        },
        shrinkWrap: true,
      ),
    );
  }
}

class UserItemListSpecific extends StatelessWidget {
  final int index;
  final List<UserItem> users;

  UserItemListSpecific({
    Key? key,
    required this.index,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupAddSpecificBloc, GroupAddSpecificState>(
      builder: (context, state) {
        var consumptions = state.consumptions
            .where((element) => element.username == users[index].username);
        return Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppCustomTheme.colors.white,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppCustomTheme.colors.lightGrey),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/avatar.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 13),
                Text(
                  users[index].username,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: AppCustomTheme.colors.black,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      iconSize: 15,
                      onPressed: () =>
                          BlocProvider.of<GroupAddSpecificBloc>(context)
                              .add(GroupAddSpecificEventAddRound(users[index])),
                      icon: Icon(Icons.add_rounded),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: AppCustomTheme.colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${consumptions.length}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: AppCustomTheme.colors.black,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 15,
                      onPressed: () => consumptions.isEmpty
                          ? null
                          : BlocProvider.of<GroupAddSpecificBloc>(context).add(
                              GroupAddSpecificEventRemoveRound(users[index])),
                      icon: Icon(Icons.remove_rounded),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
