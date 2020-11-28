import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_run/components/custom_network_image.dart';
import 'package:co_run/components/writing_box.dart';
import 'package:co_run/components/writing_box_bean.dart';
import 'package:co_run/constants/enums.dart';
import 'package:co_run/resources/colors.dart';
import 'package:co_run/themes/themes.dart';
import 'package:flutter/material.dart';

class RetrieveData extends StatefulWidget {
  List<seekerDetails> seekerDetailList = [];
  List<providerDetails> providerDetailList = [];

  String jobType;
  String uid;
  String designation;

  RetrieveData({this.jobType, this.uid, this.designation});

  @override
  _RetrieveDataState createState() => _RetrieveDataState();
}

class _RetrieveDataState extends State<RetrieveData> {
  @override
  Widget build(BuildContext context) {
    widget.seekerDetailList.add(seekerDetails(
      name: 'Anoop',
      location: 'Davanagere',
      jobtype: 'agriculture',
      experience: '0-2',
      age: '28',
      state: 'karnataka',
    ));
    widget.seekerDetailList.add(seekerDetails(
      name: 'Swaroop',
      location: 'Tumakuru',
      jobtype: 'agriculture',
      experience: '0-2',
      age: '35',
      state: 'karnataka',
    ));
    widget.seekerDetailList.add(seekerDetails(
      name: 'Santosh',
      location: 'bidar',
      jobtype: 'cooking',
      experience: '0-2',
      age: '22',
      state: 'karnataka',
    ));
    widget.seekerDetailList.add(seekerDetails(
      name: 'John',
      location: 'Davanagere',
      jobtype: 'agriculture',
      experience: '0-3',
      age: '27',
      state: 'karnataka',
    ));

    widget.seekerDetailList.add(seekerDetails(
      name: 'Johny',
      location: 'Banglore',
      jobtype: 'agriculture',
      experience: '0-3',
      age: '28',
      state: 'karnataka',
    ));

    widget.providerDetailList.add(providerDetails(
      state: 'Karnataka',
      jobtype: 'agriculture',
      location: 'Davanagere',
      company: 'abcd comp',
      salary: '3 LPA',
    ));    widget.providerDetailList.add(providerDetails(
      state: 'Karnataka',
      jobtype: 'agriculture',
      location: 'Davanagere',
      company: 'abcd comp',
      salary: '3 LPA',
    ));    widget.providerDetailList.add(providerDetails(
      state: 'Karnataka',
      jobtype: 'agriculture',
      location: 'Davanagere',
      company: 'abcd comp',
      salary: '3 LPA',
    ));    widget.providerDetailList.add(providerDetails(
      state: 'Karnataka',
      jobtype: 'agriculture',
      location: 'Davanagere',
      company: 'abcd comp',
      salary: '3 LPA',
    ));    widget.providerDetailList.add(providerDetails(
      state: 'Karnataka',
      jobtype: 'agriculture',
      location: 'Davanagere',
      company: 'abcd comp',
      salary: '3 LPA',
    ));

    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('users/TV5yS59TTRUfkkmb0IN1/agriculture')
            .where("designation", isEqualTo: 'SEEKER')
            .snapshots(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          seekerDetails bean;
          print(999);
          return ListView.builder(
            itemCount: widget.seekerDetailList.length,
            // itemCount: userSnapshot.data.documents.length,
            itemBuilder: (ctx, index) {
              print('1');
              // print(userSnapshot);
              // bean.name = userSnapshot.data.documents[index]['name'].toString();
              // bean.state = userSnapshot.data.documents[index]['state'].toString();
              // bean.age = userSnapshot.data.documents[index]['age'].toString();
              // bean.experience =
              //     userSnapshot.data.documents[index]['experience'].toString();
              // bean.location =
              //     userSnapshot.data.documents[index]['address'].toString();
              // bean.jobtype =
              //     userSnapshot.data.documents[index]['jobType'].toString();
              //
              // // widget.seekerDetailList.add(bean);
              // print(bean.location);
              return Requests(
                designation: Designation.PROVIDER,
                seekerDetailsBean: widget.seekerDetailList[index],
              );
            },
          );
        },
      ),
    );
  }
}

class Requests extends StatefulWidget {
  Designation designation;
  String imageUrl =
      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBarack_Obama&psig=AOvVaw0gtQV2rEriOevg8_QtXX6r&ust=1606649651941000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNiz0MGSpe0CFQAAAAAdAAAAABAD';
  seekerDetails seekerDetailsBean;
  providerDetails providerDetailsBean;

  Requests({
    @required this.designation,
    this.seekerDetailsBean,
    this.providerDetailsBean,
  });

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  TextEditingController _writingBoxController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    CircleAvatar(
                      child: Icon(Icons.person_rounded),
                      radius: 40.0,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: getDetails(
                          designation: widget.designation,
                          seekerDetailsBean: widget.seekerDetailsBean,
                        ),
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
                            hintText: 'Tell the provider more about yourself'),
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

List<Widget> getDetails({
  Designation designation,
  seekerDetails seekerDetailsBean,
  providerDetails providerDetailsBean,
}) {
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
        'Name: ${seekerDetailsBean.name}',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Industry: ${seekerDetailsBean.jobtype}',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Age: ${seekerDetailsBean.age}',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'State: ${seekerDetailsBean.state}',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Location:${seekerDetailsBean.location} ',
        style: MyTheme.h6(),
      ),
      SizedBox(height: 5),
      Text(
        'Experience: ${seekerDetailsBean.experience}',
        style: MyTheme.h6(),
      ),
    ];
  }
  return texts;
}

Designation getDesignation(String name) {
  if (name == 'SEEKER')
    return Designation.SEEKER;
  else
    return Designation.PROVIDER;
}

class seekerDetails {
  String name;
  String jobtype;
  String age;
  String state;
  String location;
  String experience;
  String imageURL;

  seekerDetails(
      {this.name,
      this.jobtype,
      this.age,
      this.state,
      this.location,
      this.experience,
      this.imageURL});
}

class providerDetails {
  String company;
  String jobtype;
  String state;
  String location;
  String salary;
  String imageURL;

  providerDetails({
    this.company,
    this.jobtype,
    this.state,
    this.location,
    this.salary,
    this.imageURL,
  });
}
