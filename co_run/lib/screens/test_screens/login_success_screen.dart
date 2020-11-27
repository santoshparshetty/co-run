import 'package:co_run/themes/themes.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Login Success',
        style: MyTheme.large(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
