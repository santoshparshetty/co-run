import 'package:co_run/router/routes.dart';
import 'package:co_run/screens/start.dart';
import 'package:co_run/screens/test_screens/demo_screen.dart';
import 'package:co_run/screens/test_screens/file_upload_test_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.start:
        return MaterialPageRoute(builder: (_) => Start());
      case Routes.demoScreen:
        return MaterialPageRoute(builder: (_) => DemoScreen());
      case Routes.fileUpload:
        return MaterialPageRoute(builder: (_) => NotesUpload());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
