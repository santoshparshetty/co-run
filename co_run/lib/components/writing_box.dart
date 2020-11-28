import 'package:co_run/components/writing_box_bean.dart';
import 'package:co_run/resources/colors.dart';
import 'package:co_run/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritingBox extends StatelessWidget {
  final WritingBoxBean writingBoxBean;

  WritingBox({@required this.writingBoxBean});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColor.white,
      elevation: 6,
      borderRadius: BorderRadius.all(
        Radius.circular(
          MyBorderRadius.medium,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          20,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: writingBoxBean.hintText,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: MyColor.blue,
              ),
            ),
          ),
          textAlign: (writingBoxBean.textCenterAlign == true)
              ? TextAlign.center
              : TextAlign.start,
          keyboardType: (writingBoxBean.keyboardType == null)
              ? TextInputType.text
              : writingBoxBean.keyboardType,
          maxLines: writingBoxBean.maxLines,
          controller: writingBoxBean.controller,
        ),
      ),
    );
  }
}
