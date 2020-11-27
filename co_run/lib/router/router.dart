import 'package:co_run/router/routes.dart';
import 'package:co_run/screens/start.dart';
import 'package:co_run/screens/test_screens/auth_screen.dart';
import 'package:co_run/screens/test_screens/desg_selector.dart';
import 'package:co_run/screens/test_screens/splash.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.start:
        return MaterialPageRoute(builder: (_) => Start());
      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case Routes.designationSelector:
        return MaterialPageRoute(builder: (_) => DesignationSelector());
        case Routes.professionalDetails:
      return MaterialPageRoute(builder: (_) => Start());
      //TODO : implement professional details screen
      // case Routes.personalDetails:
      //   return MaterialPageRoute(builder: (_) => PersonalDetails(designation: ,));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
