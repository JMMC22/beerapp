import 'package:beerapp/src/data/group/models/group.dart';
import 'package:beerapp/src/presentation/groups/details/bloc/bloc/groupdetails_bloc.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarChartGroup extends StatelessWidget {
  const BarChartGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailsBloc, GroupDetailsState>(
      builder: (context, state) {
        if (state is GroupDetailsLoaded) {
          return Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Container(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.group.members.length,
                itemBuilder: (context, index) {
                  return BarCharItem(user: state.group.members[index]);
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class BarCharItem extends StatelessWidget {
  final UserItem user;

  const BarCharItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 180,
            width: 30,
            decoration: BoxDecoration(
              color: AppCustomTheme.colors.lightGrey,
            ),
          ),
          Stack(
            children: [
              Container(
                height: 100, // Value
                width: 30,
                decoration: BoxDecoration(color: AppCustomTheme.colors.beer),
              ),
              const FoamBeer()
            ],
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppCustomTheme.colors.lightGrey),
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/images/avatar.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoamBeer extends StatelessWidget {
  const FoamBeer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 10,
      decoration: BoxDecoration(
        color: AppCustomTheme.colors.white,
      ),
    );
  }
}
