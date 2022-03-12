import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;
  final Function onTap;

  CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 50, top: 15, bottom: 25, right: 50),
        child: _builderNavBar(widget.currentIndex),
      ),
    );
  }

  Widget _builderNavBar(int currentIndex) {
    return Row(
      children: [
        Container(
          child: TextButton(
            onPressed: () => widget.onTap(0),
            style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent)),
            child: Column(
              children: [
                Image(
                  image: currentIndex == 0
                      ? const AssetImage('assets/icons/home_selected.png')
                      : const AssetImage('assets/icons/home_unselected.png'),
                  width: 35,
                  height: 35,
                ),
                Visibility(
                  visible: currentIndex == 0 ? true : false,
                  child: Container(
                    height: 2,
                    width: 35,
                    color: AppCustomTheme.colors.bottomNavDarkBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Container(
          child: TextButton(
            onPressed: () => widget.onTap(1),
            style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent)),
            child: Column(
              children: [
                Image(
                  image: currentIndex == 1
                      ? const AssetImage('assets/icons/stadistics_selected.png')
                      : const AssetImage(
                          'assets/icons/stadistics_unselected.png'),
                  width: 35,
                  height: 35,
                ),
                Visibility(
                  visible: currentIndex == 1 ? true : false,
                  child: Container(
                    height: 2,
                    width: 35,
                    color: AppCustomTheme.colors.bottomNavDarkYellow,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Container(
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent)),
            onPressed: () => widget.onTap(2),
            child: Column(
              children: [
                Image(
                  image: currentIndex == 2
                      ? const AssetImage('assets/icons/profile_selected.png')
                      : const AssetImage('assets/icons/profile_unselected.png'),
                  width: 35,
                  height: 35,
                ),
                Visibility(
                  visible: currentIndex == 2 ? true : false,
                  child: Container(
                    height: 2,
                    width: 35,
                    color: AppCustomTheme.colors.bottomNavLightRed,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
