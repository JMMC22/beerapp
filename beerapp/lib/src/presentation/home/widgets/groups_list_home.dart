import 'package:beerapp/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GroupListHome extends StatelessWidget {
  GroupListHome({Key? key}) : super(key: key);

  final List<String> testList = [
    'test1',
    'test2',
    'test1',
    'test2',
    'test1',
    'test2'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Grupos',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: AppCustomTheme.colors.black,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ListView.separated(
            padding: const EdgeInsets.only(bottom: 25),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: testList.length,
            itemBuilder: (context, index) {
              return GroupItemList(
                index: index,
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

  GroupItemList({
    Key? key,
    required this.index,
  }) : super(key: key);

  final List<String> testList = [
    'test1',
    'test2',
    'test1',
    'test2',
    'test1',
    'test2'
  ];

  @override
  Widget build(BuildContext context) {
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
                    testList[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: AppCustomTheme.colors.black,
                    ),
                  ),
                  Text(
                    '31 Oct 2022',
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
                '69,50€',
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
