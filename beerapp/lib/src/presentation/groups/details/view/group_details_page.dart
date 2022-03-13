import 'package:beerapp/src/presentation/groups/details/view/group_details_body.dart';
import 'package:beerapp/src/themes/themes.dart';
import 'package:flutter/material.dart';

class GroupDetailsPage extends StatelessWidget {
  const GroupDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
