import 'package:co_run/resources/strings.dart';
import 'package:co_run/router/navigation_service.dart';
import 'package:co_run/router/routes.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyString.appName,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: RaisedButton(
              onPressed: () {
                NavigationService.instance.pushNamed(
                  context,
                  Routes.demoScreen,
                );
              },
              child: Text("notification"),
            ),
          ),
        ],
      ),
    );
  }
}
