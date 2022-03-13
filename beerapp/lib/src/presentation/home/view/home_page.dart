import 'package:beerapp/src/presentation/home/widgets/header_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderHome(),
          ],
        ),
      ),
    );
  }
}
