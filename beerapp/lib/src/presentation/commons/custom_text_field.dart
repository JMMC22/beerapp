import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class CustomTextField extends StatefulWidget {
  final String tintText;
  final Function(String) validator;
  final String? errorText;

  const CustomTextField({
    Key? key,
    required this.tintText,
    required this.validator,
    this.errorText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.tintText,
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: AppCustomTheme.colors.black,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          cursorColor: AppCustomTheme.colors.grey,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.tintText,
            hintStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              color: AppCustomTheme.colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppCustomTheme.colors.lightGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppCustomTheme.colors.grey),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppCustomTheme.colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppCustomTheme.colors.red),
            ),
            errorText: widget.errorText,
            errorStyle: TextStyle(
              fontSize: 13,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              color: AppCustomTheme.colors.red,
            ),
          ),
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            color: AppCustomTheme.colors.black,
          ),
          onChanged: widget.validator,
        ),
      ],
    );
  }
}
