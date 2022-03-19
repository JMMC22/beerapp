import 'package:beerapp/src/presentation/commons/loading.dart';
import 'package:beerapp/src/presentation/groups/create/view/creategroup_page.dart';
import 'package:beerapp/src/presentation/groups/details/view/group_details_page.dart';
import 'package:beerapp/src/presentation/home/view/home_page.dart';
import 'package:beerapp/src/presentation/profile/view/profile_page.dart';
import 'package:beerapp/src/presentation/register/view/register_page.dart';
import 'package:beerapp/src/presentation/root_page.dart';
import 'package:beerapp/src/presentation/stadistics/view/stadistics_page.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const RootPage());
      case '/register':
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/stadistics':
        return MaterialPageRoute(builder: (context) => const StadisticsPage());
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      case '/group':
        return MaterialPageRoute(
            builder: (context) => const GroupDetailsPage());
      case '/loading':
        return MaterialPageRoute(builder: (context) => const LoadingScreen());
      case '/create-group':
        return MaterialPageRoute(builder: (context) => const CreateGroupPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
