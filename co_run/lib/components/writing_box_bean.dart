import 'package:flutter/material.dart';

class WritingBoxBean {
  int maxLines;
  TextEditingController controller;
  String hintText;
  TextInputType keyboardType;
  bool textCenterAlign;

  WritingBoxBean({
    @required this.maxLines,
    @required this.controller,
    @required this.hintText,
    this.keyboardType,
    @required this.textCenterAlign,
  });
}
