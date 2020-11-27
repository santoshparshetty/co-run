import 'package:co_run/constants/constants.dart';
import 'package:co_run/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future loginUser(
    String phone,
    BuildContext context,
    Function successCallback,
    Function failureCallback,
    Function timeoutCallback,
    Function codeSentToUserCallback) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  _auth.verifyPhoneNumber(
    phoneNumber: MyString.countryPhoneCode + phone,
    timeout: MyConstant.duration(60),
    verificationCompleted: (AuthCredential credential) async {
      await successCallback(context);
    },
    verificationFailed: (dynamic exception) {
      failureCallback(context);
    },
    codeSent: (String verificationId, [int forceResendingToken]) {
      codeSentToUserCallback(context);
    },
    codeAutoRetrievalTimeout: (value) {
      timeoutCallback(context);
    },
  );
}
