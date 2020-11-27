import 'package:co_run/components/input_text_box/input_text_box.dart';
import 'package:co_run/components/upload_pdf.dart';
import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class NotesUpload extends StatefulWidget {
  @override
  _NotesUploadState createState() => _NotesUploadState();
}

class _NotesUploadState extends State<NotesUpload> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MyPadding.s1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UploadAdhaar(),
              InputTextBox(
                isMarginRequired: true,
                autoFocus: false,
                controller: TextEditingController(),
                labelText: '1234',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid phone number';
                  }
                  return null;
                },),InputTextBox(
                isMarginRequired: true,
                autoFocus: false,
                controller: TextEditingController(),
                labelText: '1234',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid phone number';
                  }
                  return null;
                },),InputTextBox(
                isMarginRequired: true,
                autoFocus: false,
                controller: TextEditingController(),
                labelText: '1234',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid phone number';
                  }
                  return null;
                },),InputTextBox(
                isMarginRequired: true,
                autoFocus: false,
                controller: TextEditingController(),
                labelText: '1234',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid phone number';
                  }
                  return null;
                },),InputTextBox(
                isMarginRequired: true,
                autoFocus: false,
                controller: TextEditingController(),
                labelText: '1234',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid phone number';
                  }
                  return null;
                },),InputTextBox(
                isMarginRequired: true,
                autoFocus: false,
                controller: TextEditingController(),
                labelText: '1234',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid phone number';
                  }
                  return null;
                },),InputTextBox(
                isMarginRequired: true,
                autoFocus: false,
                controller: TextEditingController(),
                labelText: '1234',
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid phone number';
                  }
                  return null;
                },),
            ],
          ),
        ),
      ),
    );
  }
}
