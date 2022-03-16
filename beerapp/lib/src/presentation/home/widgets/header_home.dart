import 'package:beerapp/src/preferences/user_preferences.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 40, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡Hi, nombre!',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              color: AppCustomTheme.colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Aquí tendrás un resumen de tu balance de hoy y el listado de tus grupos',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              color: AppCustomTheme.colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
