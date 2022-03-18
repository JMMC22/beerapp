import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 60,
      color: AppCustomTheme.colors.red,
      child: Row(children: [
        Text(
          'Vaya, parece que hemos tenido un error.',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: AppCustomTheme.colors.white,
          ),
        )
      ]),
    );
  }
}
