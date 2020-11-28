import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_run/components/pdf_display.dart';
import 'package:co_run/components/upload_pdf.dart';
import 'package:co_run/constants/enums.dart';
import 'package:co_run/resources/colors.dart';
import 'package:co_run/resources/strings.dart';
import 'package:co_run/router/navigation_service.dart';
import 'package:co_run/router/routes.dart';
import 'package:co_run/screens/test_screens/bean/personal_details_bean.dart';
import 'package:co_run/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class JobRequirementScreen extends StatefulWidget {
  final Designation designation;
  final PersonalDetailsBean bean;

  JobRequirementScreen({@required this.designation, @required this.bean});

  @override
  _JobRequirementScreenState createState() => _JobRequirementScreenState();
}

class _JobRequirementScreenState extends State<JobRequirementScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String jobType;
  String age;
  String experience;
  String state;
  TextEditingController _districtController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _companyName = TextEditingController();

  File myDocument;

  void setFile(File document) {
    setState(() {
      myDocument = document;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: MyColor.blue,
        title: Text(
          MyString.professionalDetails,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MyPadding.s6,
            horizontal: MyPadding.s6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  (widget.designation == Designation.SEEKER)
                      ? MyString.professionalDetails
                      : MyString.companyDetails,
                  textAlign: TextAlign.center,
                  style: MyTheme.h4(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              getDropDownField(
                  context: context,
                  hintText: 'Industry',
                  options: [
                    'Agriculture',
                    'Aviation',
                    'Automobile',
                    'Banking',
                    'Cooking',
                    'Construction',
                    'Farming',
                    'Hotel',
                    'Management',
                    'IT',
                    'Security',
                    'Others',
                  ],
                  onSelected: (value) {
                    jobType = value;
                  }),
              (widget.designation == Designation.PROVIDER)
                  ? SizedBox(
                      height: 30,
                    )
                  : Container(),
              (widget.designation == Designation.PROVIDER)
                  ? TextFormField(
                      controller: _companyName,
                      decoration: InputDecoration(
                        labelText: MyString.companyName,
                        contentPadding: EdgeInsets.fromLTRB(
                          MyPadding.s1,
                          MyPadding.s1,
                          0,
                          0,
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 30,
              ),
              getDropDownField(
                context: context,
                hintText: (widget.designation == Designation.SEEKER)
                    ? 'Age'
                    : 'Age Group required',
                options: [
                  '18-25 Years',
                  '26-30 Years',
                  '31-35 Years',
                  '36-40 Years',
                  '41-45 Years',
                  '46-50 Years',
                  '51-55 Years',
                  '56-60 Years'
                ],
                onSelected: (value) {
                  age = value;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              getDropDownField(
                context: context,
                hintText: (widget.designation == Designation.SEEKER)
                    ? 'Experience'
                    : 'Experience required',
                options: [
                  '0-3 Years',
                  '4-6 Years',
                  'Above 6 Years',
                ],
                onSelected: (value) {
                  experience = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              getDropDownField(
                context: context,
                hintText: 'State',
                options: [
                  'Andhra Pradesh',
                  'Karnataka',
                  'Kerala',
                  'Maharastra',
                  'Tamil Nadu',
                ],
                onSelected: (value) {
                  state = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'District',
                style: MyTheme.h7(
                  fontWeight: FontWeight.normal,
                  themeColor: MyColor.defaultColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _districtController,
                decoration: InputDecoration(
                  labelText: (widget.designation == Designation.PROVIDER)
                      ? MyString.companyLocationDetails
                      : MyString.enterDistrict,
                  contentPadding: EdgeInsets.fromLTRB(
                    MyPadding.s1,
                    MyPadding.s1,
                    0,
                    0,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              (widget.designation == Designation.PROVIDER)
                  ? TextFormField(
                      controller: _salaryController,
                      decoration: InputDecoration(
                        labelText: MyString.salaryOffered,
                        contentPadding: EdgeInsets.fromLTRB(
                          MyPadding.s1,
                          MyPadding.s1,
                          0,
                          0,
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 30,
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
                  myDocument == null
                      ? Text(
                          (widget.designation == Designation.PROVIDER)
                              ? 'Please upload Resume'
                              : 'Upload company verification document',
                          style: MyTheme.h7(
                            themeColor: Colors.red,
                            fontWeight: FontWeight.w200,
                          ),
                        )
                      : FlatButton(
                          onPressed: () {
                            print(myDocument.path);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DisplayNotes(
                                        file: myDocument,
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
              Center(
                child: RaisedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    if (widget.designation == Designation.SEEKER) {
                      if (jobType == null ||
                          age == null ||
                          experience == null ||
                          state == null ||
                          _districtController == null ||
                          _districtController.text == '' ||
                          myDocument == null) {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                              MyString.pleaseEnterAllInfo,
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: MyColor.blue,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            elevation: 6,
                          ),
                        );
                      } else {
                        final FirebaseUser user = await _auth.currentUser();
                        final uid = user.uid;
                        print(uid);

                        final ref = FirebaseStorage.instance
                            .ref()
                            .child('user_resume')
                            .child(uid + '.pdf');
                        await ref.putFile(myDocument).onComplete;
                        final docURL = await ref.getDownloadURL();
                        print(docURL);
                        await Firestore.instance
                            .collection(
                                'users/TV5yS59TTRUfkkmb0IN1/${jobType.toLowerCase()}')
                            .document(uid)
                            .setData({
                          'name': widget.bean.name,
                          'state': widget.bean.state,
                          'pincode': widget.bean.pincode,
                          'city': widget.bean.city,
                          'adhaar': widget.bean.adhaar,
                          'address': widget.bean.address,
                          'adhaarURL': widget.bean.adhaarURL,
                          'jobType': jobType,
                          'age': age,
                          'experience': experience,
                          'districtController': _districtController.text,
                          'resume_link': docURL,
                          'designation': 'SEEKER',
                        });

                        NavigationService.instance
                            .pushReplacementNamed(context, Routes.homeScreen);
                      }
                    } else {
                      if (jobType == null ||
                          state == null ||
                          _districtController == null ||
                          _districtController.text == '' ||
                          _salaryController.text == '' ||
                          _salaryController.text == null ||
                          _companyName.text == '' ||
                          _companyName.text == null ||
                          age == null ||
                          experience == null ||
                          myDocument == null) {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                              MyString.pleaseEnterAllInfo,
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: MyColor.blue,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            elevation: 6,
                          ),
                        );
                      } else {
                        final FirebaseUser user = await _auth.currentUser();
                        final uid = user.uid;
                        print(uid);
                        final ref = FirebaseStorage.instance
                            .ref()
                            .child('company_details')
                            .child(uid + '.pdf');
                        await ref.putFile(myDocument).onComplete;
                        final docURL = await ref.getDownloadURL();
                        print(docURL);

                        await Firestore.instance
                            .collection(
                                'users/D6mKIrSGKyPCc8FsZgTv/professional/BcJQhVimyrOuLN2XNei6/${jobType.toLowerCase()}')
                            .document(uid)
                            .setData({
                          'name': widget.bean.name,
                          'state': widget.bean.state,
                          'pincode': widget.bean.pincode,
                          'city': widget.bean.city,
                          'adhaar': widget.bean.adhaar,
                          'address': widget.bean.address,
                          'adhaarURL': widget.bean.adhaarURL,
                          'jobType': jobType,
                          'company_name': _companyName.text,
                          'age_required': age,
                          'experience': experience,
                          'districtController': _districtController.text,
                          'salaryController': _salaryController.text,
                          'company_detail': docURL,
                          'designation': 'PROVIDER',
                        });
                        NavigationService.instance
                            .pushReplacementNamed(context, Routes.homeScreen);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getDropDownField({
  @required BuildContext context,
  @required String hintText,
  List<dynamic> options,
  Function onSelected,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        hintText,
        style: MyTheme.h7(
          fontWeight: FontWeight.normal,
          themeColor: MyColor.defaultColor,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Material(
        color: MyColor.white,
        elevation: 2,
        borderRadius: BorderRadius.all(
          Radius.circular(
            MyBorderRadius.small,
          ),
        ),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                MyBorderRadius.small,
              ),
            ),
          ),
          width: MediaQuery.of(context).size.width / 1.5,
          child: DropdownButtonFormField(
            hint: Text(
              'Select',
              style: MyTheme.h7(
                themeColor: MyColor.defaultColor,
                fontWeight: FontWeight.normal,
              ),
            ),
            decoration: InputDecoration(
              fillColor: MyColor.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyColor.white,
                ),
              ),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: MyColor.defaultColor,
            ),
            items: getDropdownMenuItems(options),
            onChanged: onSelected,
          ),
        ),
      ),
    ],
  );
}

List<DropdownMenuItem> getDropdownMenuItems(
  List<dynamic> options,
) {
  List<DropdownMenuItem> list = [];
  for (int i = 0; i < options.length; i++) {
    list.add(
      DropdownMenuItem(
        child: Text(
          options[i],
        ),
        value: options[i],
      ),
    );
  }
  return list;
}
