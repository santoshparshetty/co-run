import 'package:flutter/material.dart';

const kcelebrationIcon=    Icon(Icons.celebration,color: Colors.pinkAccent,);
const kTextStyle = TextStyle(color: Colors.black,fontSize: 22);
const kCongratsText=TextStyle(color: Colors.green,fontSize: 25);

class ConclusionPage extends StatefulWidget {
  @override
  _ConclusionPageState createState() => _ConclusionPageState();
}

class _ConclusionPageState extends State<ConclusionPage> {
  String companyName='Cisco';
  String companyCity='Bengaluru';
  String companyState='Karnataka';
  int salary=60000;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Success !!'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child:  Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                 Text('Hey!!! Congratulations ',style: kCongratsText,),
                 kcelebrationIcon,
                 kcelebrationIcon
               ],
            ),
               margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
              color: Colors.white30,
                borderRadius: BorderRadius.circular(10.0),

      ),
          ),),
          Expanded(
            child:  Container(
              child: Text('YOU ARE NOW AN EMPLOYEE',style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold,),),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10.0),

              ),
            ),),
          Text('Here is the Details of your company ... ',style: TextStyle(color: Colors.black,fontSize: 18,),),
          Expanded(
            flex: 3,
            child:Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(' Company Name : ',style: kTextStyle,),
                      Text(' City : ',style: kTextStyle,),
                      Text(' State :' ,style: kTextStyle,),
                      Text('Salary : ',style: kTextStyle,),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('$companyName',style: kTextStyle,),
                      Text('$companyCity',style: kTextStyle,),
                      Text('$companyState',style: kTextStyle,),
                      Text('$salary',style: kTextStyle,),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.chat,color: Colors.black,),
                      Icon(Icons.insert_drive_file_rounded,color: Colors.black,),

                    ],
                  ),
                ],
              ),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400].withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
