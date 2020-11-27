import 'dart:io';

import 'package:co_run/components/input_text_box/input_text_box.dart';
import 'package:co_run/components/pdf_display.dart';
import 'package:co_run/components/upload_pdf.dart';
import 'package:co_run/themes/themes.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController adhaar = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController doorAndLandmark = TextEditingController();
  File adhaarFile;

  final _formKey = GlobalKey<FormState>();

  void setFile(File document) {
    setState(() {
      adhaarFile = document;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Enter personal details',
        style:MyTheme.h6(
              themeColor: Colors.white,
              fontWeight: FontWeight.normal),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputTextBox(
                isMarginRequired: true,
                controller: name,
                maxLength: 25,
                labelText: 'Full name',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid name';
                  }
                  return null;
                },
              ),
              InputTextBox(
                isMarginRequired: true,
                controller: email,
                maxLength: 20,
                keyboardType: TextInputType.emailAddress,
                labelText: 'email',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid email';
                  }
                  return null;
                },
              ),
              InputTextBox(
                isMarginRequired: true,
                controller: state,
                maxLength: 15,
                labelText: 'state',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid state';
                  }
                  return null;
                },
              ),
              InputTextBox(
                isMarginRequired: true,
                controller: city,
                maxLength: 10,
                labelText: 'city',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid city';
                  }
                  return null;
                },
              ),
              InputTextBox(
                isMarginRequired: true,
                controller: pincode,
                maxLength: 6,
                keyboardType: TextInputType.number,
                labelText: 'pincode',
                validationFunction: (value) {
                  if (value.isEmpty || int.parse(value) < 99999) {
                    return 'Please enter the valid pincode';
                  }
                  return null;
                },
              ),
              InputTextBox(
                isMarginRequired: true,
                controller: doorAndLandmark,
                maxLength: 70,
                labelText: 'Door no And Landmark',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid landmark';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  UploadAdhaar(
                    userID: 'swaroop1234asdf0',
                    isFileUploaded: setFile,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                   adhaarFile == null
                      ? Text(
                          'Please upload Adhaar',
                     style: MyTheme.h7(
                       themeColor: Colors.red,
                       fontWeight: FontWeight.w200,
                     ),
                        )
                      : FlatButton(
                          onPressed: () {
                          print(adhaarFile.path);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DisplayNotes(
                                        file: adhaarFile,
                                      )),
                            );
                          },
                          child: Text(
                            'Open document',
                            style: MyTheme.h7(
                                fontWeight: FontWeight.normal,
                                themeColor: Colors.grey),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState.validate() && adhaarFile != null) {
                    //Todo :implement on validate function
                    print(name.text);
                    print(adhaarFile.path);


                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
