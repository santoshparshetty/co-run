import 'dart:io';

import 'package:co_run/components/input_text_box/input_text_box.dart';
import 'package:co_run/components/pdf_display.dart';
import 'package:co_run/components/upload_pdf.dart';
import 'package:co_run/constants/enums.dart';
import 'package:co_run/router/navigation_service.dart';
import 'package:co_run/router/routes.dart';
import 'package:co_run/screens/test_screens/job_requirement.dart';
import 'package:co_run/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'bean/personal_details_bean.dart';

class PersonalDetails extends StatefulWidget {
  final Designation designation;
  //1-Job provider
  //0-Job seeker
  PersonalDetails({@required this.designation});

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController adhaar = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController address = TextEditingController();
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
        title: Text(
          'Enter personal details',
          style: MyTheme.h6(
              themeColor: Colors.white, fontWeight: FontWeight.normal),
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
                controller: adhaar,
                maxLength: 12,
                keyboardType: TextInputType.emailAddress,
                labelText: 'adhaar no',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid adhaar';
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
                controller: address,
                maxLength: 70,
                labelText: 'address',
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
                onPressed: () async {
                  if (_formKey.currentState.validate() && adhaarFile != null) {
                    print(name.text);
                    print(adhaarFile.path);

                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final FirebaseUser user = await auth.currentUser();
                    final uid = user.uid;
                    print(uid);

                    final ref = FirebaseStorage.instance
                        .ref()
                        .child('user_adhaar')
                        .child(uid + '.pdf');

                    await ref.putFile(adhaarFile).onComplete;
                    final adhaarUrl = await ref.getDownloadURL();
                    print(adhaarUrl);

                    //   await Firestore.instance
                    //       .collection('users/DlwhA4SMfP1vyDE5WImv/personal_details')
                    //       .document(uid)
                    //       .updateData({
                    //     'designation':designation,
                    //     'name': name.text,
                    //     'adhaarNumber':adhaar.text,
                    //      'state': state.text,
                    //      'city': city.text,
                    //      'pincode': pincode.text,
                    //      'address': address.text,
                    //      'adhaarUrl' : adhaarUrl,
                    //   });
                    PersonalDetailsBean bean = PersonalDetailsBean(
                      name: name.text,
                      adhaar: adhaar.text,
                      address: adhaar.text,
                      adhaarURL: adhaarUrl,
                      city: city.text,
                      pincode: pincode.text,
                      state: state.text,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JobRequirementScreen(designation: widget.designation , bean: bean)),
                    );
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
