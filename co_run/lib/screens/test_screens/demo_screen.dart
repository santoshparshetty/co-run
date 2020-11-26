import 'package:co_run/themes/themes.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'HELLO WORLD',
        style: MyTheme.large(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
