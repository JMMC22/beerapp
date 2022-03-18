import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCustomTheme.colors.backgroundGrey,
      body: Center(
        child: Image.asset(
          'assets/images/loader.gif',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
