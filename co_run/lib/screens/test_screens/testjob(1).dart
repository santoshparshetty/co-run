import 'package:flutter/material.dart';
class TestJob extends StatefulWidget {
  @override
  _TestJobState createState() => _TestJobState();
}

class _TestJobState extends State<TestJob> {
  String joberName='Santosh';
  int joberage=21;
  int joberRating=4;
  int joberExperience=3;
  String accept='Accept';
  String reject='Reject';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Confirmation Page'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child:Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(' Name : ',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('Experience : ',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('Age :' ,style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('Rating : ',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$accept ',style: TextStyle(color: Colors.green,fontSize: 18),),

                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('$joberName',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$joberExperience',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$joberage',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$joberRating',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$reject',style: TextStyle(color: Colors.red,fontSize: 18),),


                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.send,color: Colors.black,),
                        Icon(Icons.videocam_rounded,color: Colors.black,),

                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
          ),
          Expanded(
              child:Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(' Name : ',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('Experience : ',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('Age :' ,style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('Rating : ',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$accept ',style: TextStyle(color: Colors.green,fontSize: 18),),

                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('$joberName',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$joberExperience',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$joberage',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$joberRating',style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text('$reject',style: TextStyle(color: Colors.red,fontSize: 18),),


                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.send,color: Colors.black,),
                        Icon(Icons.videocam_rounded,color: Colors.black,),

                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
