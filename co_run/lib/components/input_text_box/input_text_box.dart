import 'package:co_run/themes/themes.dart';
import 'package:flutter/material.dart';


class InputTextBox extends StatelessWidget {
  final bool isPassword;
  final TextInputType keyboardType;
  final bool autoFocus;
  final TextAlign textAlign;
  final int maxLength;
  final Function validationFunction;
  final int maxLines;
  final int minLines;

  final TextStyle textStyle;
  final EdgeInsetsGeometry margin;
  final bool isMarginRequired;
  final String labelText;
  final TextStyle labelTextStyle;

  final TextEditingController controller;

  InputTextBox({
    this.isPassword,
    this.keyboardType,
    this.autoFocus,
    this.textAlign,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.validationFunction,
    this.textStyle,
    this.margin,
    @required this.isMarginRequired,
    this.labelText,
    this.labelTextStyle,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (isMarginRequired == true)
          ? margin ??
              EdgeInsets.symmetric(
                vertical: MyPadding.s1,
                horizontal: MyPadding.s2,
              )
          : EdgeInsets.all(0.0),
            child: TextFormField(
              obscureText: isPassword ?? false,
              keyboardType: keyboardType ?? TextInputType.text,
              autofocus: autoFocus ?? false,
              textAlign: textAlign ?? TextAlign.start,
              maxLength: maxLength,
              validator: validationFunction,
              controller: controller,
              maxLines: maxLines ?? 1,
              minLines: minLines ?? 1,
              style: textStyle ??
                  MyTheme.h6(
                    themeColor: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
              decoration: InputDecoration(
              labelText: labelText,
              labelStyle: labelTextStyle ??
                    MyTheme.h7(
                      fontWeight: FontWeight.w300,
                      themeColor: Colors.black,
                    ),
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
                counterText: "",
              ),
            ),
    );
  }
}
