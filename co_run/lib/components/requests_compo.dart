import 'package:co_run/components/custom_network_image.dart';
import 'package:co_run/components/writing_box.dart';
import 'package:co_run/components/writing_box_bean.dart';
import 'package:co_run/constants/enums.dart';
import 'package:co_run/resources/colors.dart';
import 'package:co_run/themes/themes.dart';
import 'package:flutter/material.dart';



class RetrieveData extends StatefulWidget {
  @override
  _RetrieveDataState createState() => _RetrieveDataState();
}

class _RetrieveDataState extends State<RetrieveData> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}







class Requests extends StatefulWidget {
  Designation designation;
  String imageUrl;

  Requests({
    @required this.designation,
    @required this.imageUrl,
  });

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  TextEditingController _writingBoxController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return
       Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MyPadding.s5,
          vertical: MyPadding.s5,
        ),
        child: Material(
          color: MyColor.white,
          elevation: 2,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MyBorderRadius.medium,
            ),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(
                MyPadding.s3,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyNetworkImage(
                        width: 80,
                        height: 80,
                        totalHeight: 80,
                        totalWidth: 80,
                        imageURL: widget.imageUrl,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: getDetails(widget.designation),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  (isVisible && widget.designation == Designation.SEEKER)
                      ? WritingBox(
                          writingBoxBean: WritingBoxBean(
                              controller: _writingBoxController,
                              textCenterAlign: true,
                              maxLines: 5,
                              hintText:
                                  'Tell the provider more about yourself'),
                        )
                      : Container(),
                  (isVisible)
                      ? SizedBox(
                          height: 10,
                        )
                      : Container(),
                  (isVisible)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              child: Text('Send Request'),
                              onPressed: () {},
                            ),
                            RaisedButton(
                              child: Icon(Icons.message),
                              onPressed: () {},
                            ),
                            RaisedButton(
                              child: Icon(Icons.video_call),
                              onPressed: () {},
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
    );
  }
}

List<Widget> getDetails(Designation designation) {
  List<Widget> texts = [];
  if (designation == Designation.SEEKER) {
    texts = [
      Text(
        'Company: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Industry: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'State: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Location: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Salary: ',
        style: MyTheme.h6(),
      ),
    ];
  } else {
    texts = [
      Text(
        'Name: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Industry: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Age: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'State: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Location: ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Experience: ',
        style: MyTheme.h6(),
      ),
    ];
  }
  return texts;
}
