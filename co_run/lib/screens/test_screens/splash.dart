import 'package:co_run/router/navigation_service.dart';
import 'package:co_run/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 2000),
          () async {
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        if (user == null) {
          print(user.uid);
          NavigationService.instance
              .pushReplacementNamed(context, Routes.authScreen);
        } else {
          NavigationService.instance
              .pushReplacementNamed(context, Routes.start);
          // TODO: home screen
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Welcome'),
        ),
      ),
    );
  }
}
