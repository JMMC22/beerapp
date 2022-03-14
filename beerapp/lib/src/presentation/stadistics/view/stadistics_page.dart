import 'package:beerapp/src/presentation/stadistics/view/stadistics_body.dart';
import 'package:flutter/material.dart';

class StadisticsPage extends StatelessWidget {
  const StadisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: StadisticsBody());
  }
}
