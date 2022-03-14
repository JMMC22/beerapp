import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';

class BarChartGroup extends StatelessWidget {
  const BarChartGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Container(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: 10,
            itemBuilder: (context, index) {
              return BarCharItem(index: index);
            },
          ),
        ));
  }
}

class BarCharItem extends StatelessWidget {
  final int index;

  const BarCharItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: double.infinity,
          width: 30,
          decoration: BoxDecoration(
              color: AppCustomTheme.colors.lightGrey,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
        ),
        Stack(
          children: [
            Container(
              height: 50, // Value
              width: 30,
              decoration: BoxDecoration(color: AppCustomTheme.colors.beer),
            ),
            const FoamBeer(),
          ],
        ),
      ],
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
      color: Colors.white,
    );
  }
}
