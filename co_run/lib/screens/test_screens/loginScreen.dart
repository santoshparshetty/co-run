import 'package:co_run/constants/otp_authentication.dart';
import 'package:co_run/resources/colors.dart';
import 'package:co_run/resources/strings.dart';
import 'package:co_run/router/navigation_service.dart';
import 'package:co_run/router/routes.dart';
import 'package:co_run/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:co_run/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static TextEditingController _phoneController = TextEditingController();

  Function otpCodeSentToUserCallback = (BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text('MyString.autoDetect'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                SpinKitFadingCircle(
                  color: MyColor.blue,
                  size: 50.0,
                ),
              ],
            ),
          );
        });
  };

  Function otpSuccessCallback = (BuildContext context) async {
    NavigationService.instance.pushNamed(
      context,
      Routes.loginSuccessScreen,
    );
  };

  Function otpFailureCallback = (BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text('MyString.internet'),
            actions: <Widget>[
              FlatButton(
                  child: Text('MyString.ok'),
                  textColor: MyColor.white,
                  color: MyColor.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  };

  Function otpTimeoutCallback = (BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              'MyString.failure(_phoneController.text)',
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('MyString.retry'),
                  textColor: MyColor.white,
                  color: MyColor.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'MyString.loginAppBarTitle',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
              ),
              child: Text(
                "CORUN",
                style: MyTheme.h1(
                  fontWeight: FontWeight.bold,
                  themeColor: MyColor.blue,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MyPadding.s5,
              ),
              child: TextFormField(
                controller: _phoneController,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Phone number",
                  errorStyle: MyTheme.h8(
                    fontWeight: FontWeight.normal,
                    themeColor: Colors.orangeAccent,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(
                    MyPadding.s1,
                    MyPadding.s1,
                    0,
                    0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () async {
                if (_phoneController.text.length < 10) {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(
                        'MyString.validPhone',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: MyColor.blue,
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                      elevation: 6,
                    ),
                  );
                } else
                  loginUser(
                    _phoneController.text,
                    context,
                    otpSuccessCallback,
                    otpFailureCallback,
                    otpTimeoutCallback,
                    otpCodeSentToUserCallback,
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
