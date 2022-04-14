import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppCustomTheme.colors.lightGrey;
          }
          return AppCustomTheme.colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
        ),
        shadowColor: MaterialStateProperty.all(AppCustomTheme.colors.black),
        elevation: MaterialStateProperty.all(3),
      ),
      child: Text(
        widget.title,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          color: AppCustomTheme.colors.black,
        ),
      ),
      onPressed: widget.onPressed,
    );
  }
}
