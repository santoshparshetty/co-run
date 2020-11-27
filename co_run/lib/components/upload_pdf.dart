import 'dart:io';

import 'package:co_run/themes/themes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadAdhaar extends StatefulWidget {
  final String userID;
  final String iconName;
  final Function isFileUploaded;

  UploadAdhaar({this.userID = 'abcd1234',this.iconName='Upload adhaar',this.isFileUploaded});

  @override
  _UploadAdhaarState createState() => _UploadAdhaarState();
}

class _UploadAdhaarState extends State<UploadAdhaar> {
  File file;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () async {
        FilePickerResult result = await FilePicker.platform.pickFiles(
          allowedExtensions: ['pdf'],
          type: FileType.custom,
        );
        setState(
              () {
            if (result != null) {
              file = File(result.files.single.path);
              print(file.path);
            }
            if (file != null) {
              NotesUploadBean bean = NotesUploadBean(
                fileName: widget.userID + '.pdf',
                file: file,
              );
              widget.isFileUploaded(file);
              // TODO 1 : Upload to firebase here
            }
          },
        );

      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            size: 16.0,
            color: Colors.green,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            widget.iconName,
            style: MyTheme.h6(
              fontWeight: FontWeight.normal,
              themeColor: Colors.green,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          MyBorderRadius.small,
        ),
      ),
      borderSide: BorderSide(
        color: Colors.green,
        width: 1.0,
      ),
    );
  }
}

class NotesUploadBean {
  final String fileName;
  final File file;
  NotesUploadBean({this.fileName, this.file});
}