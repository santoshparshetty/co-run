import 'package:co_run/screens/test_screens/personal_details.dart';
import 'package:flutter/material.dart';

class DesignationSelector extends StatefulWidget {
  @override
  _DesignationSelectorState createState() => _DesignationSelectorState();
}

class _DesignationSelectorState extends State<DesignationSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Choose your designation'),
      ),
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    disabledColor: Colors.lightBlueAccent,
                    disabledTextColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalDetails(
                            designation: 0,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Job seeker',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    disabledColor: Colors.lightBlueAccent,
                    disabledTextColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PersonalDetails(designation: 1)),
                      );
                    },
                    child: Text(
                      "Job provider",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
