import 'package:beerapp/src/data/group/models/group.dart';
import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:beerapp/src/presentation/groups/details/bloc/bloc/groupdetails_bloc.dart';
import 'package:beerapp/src/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembersGroupList extends StatelessWidget {
  MembersGroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailsBloc, GroupDetailsState>(
      builder: (context, state) {
        if (state is GroupDetailsLoaded) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Miembros',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: AppCustomTheme.colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 25,
                        icon: const Icon(Icons.add_rounded),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ListView.separated(
                  padding: const EdgeInsets.only(bottom: 25),
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.group.members.length,
                  itemBuilder: (context, index) {
                    return GroupItemList(
                      index: index,
                      members: state.group.members,
                    );
                  },
                  shrinkWrap: true,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

class GroupItemList extends StatelessWidget {
  final int index;
  final List<UserItem> members;

  GroupItemList({Key? key, required this.index, required this.members})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null, //() => Navigator.of(context).pushNamed('/group'),
      child: Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    members[index].username,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: AppCustomTheme.colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${members[index].totalConsumptions}',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: AppCustomTheme.colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
