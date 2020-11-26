import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class DisplayNotes extends StatelessWidget {
  final File file;
  DisplayNotes({this.file});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PDF.file(
          file,
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 1.1,
        ),
      ),
    );

  }
}
