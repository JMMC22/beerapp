import 'package:beerapp/src/presentation/groups/details/view/group_details_body.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';

class GroupDetailsPage extends StatelessWidget {
  const GroupDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bar',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            color: AppCustomTheme.colors.black,
          ),
        ),
        backgroundColor: AppCustomTheme.colors.backgroundGrey,
        leading: IconButton(
          iconSize: 30,
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back_ios),
          color: AppCustomTheme.colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const GroupDetailsBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppCustomTheme.colors.grey,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 25, right: 15, bottom: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(title: 'Ronda para todos', onPressed: () {}),
                      const Divider(height: 10),
                      const CustomButton(
                          title: 'Selección específica', onPressed: null),
                      const Divider(height: 10),
                      const CustomButton(
                          title: 'Cambiar precio predeterminado',
                          onPressed: null),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}

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
          return AppCustomTheme.colors.bottomNavDarkYellow;
        }),
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
