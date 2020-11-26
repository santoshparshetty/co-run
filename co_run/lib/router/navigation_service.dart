/*
 * @Author GS
 */
import 'package:flutter/cupertino.dart';

class NavigationService {
  static NavigationService _instance;
  static NavigationService get instance {
    if (_instance == null) {
      _instance = NavigationService();
    }
    return _instance;
  }

  void pushNamed(BuildContext context, String name, {dynamic arguments}) {
    Navigator.pushNamed(context, name, arguments: arguments);
  }

  void pushReplacementNamed(BuildContext context, String name,
      {dynamic arguments}) {
    Navigator.pushReplacementNamed(context, name, arguments: arguments);
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
