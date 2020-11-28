import 'package:co_run/resources/colors.dart';
import 'package:co_run/resources/strings.dart';
import 'package:co_run/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.blue,
        title: Text(
          MyString.homeScreen,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                MyPadding.s3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey There,',
                    style: MyTheme.h4(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome Back.',
                    style: MyTheme.h4(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                getOption(
                  name: 'Search',
                  icon: Icons.search,
                  onPressed: () {},
                ),
                getOption(
                  name: 'Requests',
                  icon: Icons.markunread_mailbox,
                  onPressed: () {},
                ),
                getOption(
                  name: 'Confirmed',
                  icon: Icons.check,
                  onPressed: () {},
                ),
                getOption(
                  name: 'Profile',
                  icon: Icons.person,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget getOption({String name, IconData icon, Function onPressed}) {
  return Padding(
    padding: EdgeInsets.all(
      MyPadding.s3,
    ),
    child: Material(
      color: MyColor.white,
      elevation: 2,
      borderRadius: BorderRadius.all(
        Radius.circular(
          MyBorderRadius.medium,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(
            MyPadding.s3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: MyColor.blue,
                size: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: MyTheme.h6(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
