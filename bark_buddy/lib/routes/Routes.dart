import 'package:bark_buddy/screens/dashboard.dart';
import 'package:bark_buddy/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String welcomeScreen = '/';
  static const String dashboard = '/second';
  static const String third = '/third';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      // case second:
      //   final args = settings.arguments as SecondScreenArguments;
      //   return MaterialPageRoute(builder: (_) => SecondScreen(args: args));

      default:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    }
  }

  static void navigateTo(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void replaceWith(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void popToHome(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName(welcomeScreen));
  }
}
