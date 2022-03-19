import 'package:beerapp/src/presentation/commons/commons_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class MemberListSearch extends StatefulWidget {
  final TextEditingController searchController;
  const MemberListSearch({Key? key, required this.searchController})
      : super(key: key);

  @override
  State<MemberListSearch> createState() => _MemberListSearchState();
}

class _MemberListSearchState extends State<MemberListSearch> {
  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(() {
      print(widget.searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomSearch(
        tintText: 'Buscar...', searchController: widget.searchController);
  }
}

class CustomSearch extends StatefulWidget {
  final String tintText;
  final TextEditingController searchController;
  const CustomSearch({
    Key? key,
    required this.tintText,
    required this.searchController,
  }) : super(key: key);

  @override
  State<CustomSearch> createState() => _SearchState();
}

class _SearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchController,
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
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear_rounded),
            color: AppCustomTheme.colors.grey,
            splashColor: Colors.transparent,
            onPressed: () {},
          )),
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: AppCustomTheme.colors.black,
      ),
    );
  }
}
