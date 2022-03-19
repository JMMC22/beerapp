import 'package:beerapp/src/data/user/models/Group.dart';
import 'package:beerapp/src/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class GroupListHome extends StatelessWidget {
  final List<Group> groups;

  GroupListHome({
    Key? key,
    required this.groups,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  'Grupos',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: AppCustomTheme.colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/create-group'),
                  iconSize: 25,
                  splashColor: Colors.transparent,
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
            itemCount: groups.length,
            itemBuilder: (context, index) {
              return GroupItemList(
                index: index,
                groups: groups,
              );
            },
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}

class GroupItemList extends StatelessWidget {
  final int index;
  final List<Group> groups;

  GroupItemList({
    Key? key,
    required this.index,
    required this.groups,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/group'),
      child: Container(
        height: 88,
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
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: AppCustomTheme.colors.grey,
                ),
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    groups[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: AppCustomTheme.colors.black,
                    ),
                  ),
                  Text(
                    DateFormat('dd MMMM yyyy', 'es')
                        .format(groups[index].createdAt),
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: AppCustomTheme.colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${groups[index].totalAmount} €',
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
