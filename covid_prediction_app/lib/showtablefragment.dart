import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'strings.dart';

class ShowTableFragment extends StatefulWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ShowTableFragment({Key? key}) : super(key: key);

  @override
  _ShowTableFragmentState createState()=>_ShowTableFragmentState();

}

class _ShowTableFragmentState extends State<ShowTableFragment> {



  Widget titleSection = Container(
    child:Column(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
            padding:const EdgeInsets.all(20.0),
            child:Text(
              Strings.seventhtext,
              textAlign: TextAlign.center,
              style:TextStyle(
                color: new Color(0xFFB71C1C),
                fontWeight:FontWeight.bold,
                fontSize: 30.0,

                //backgroundColor: new Color(0xFFFF7043)
              ),
            )
        ),

        Padding(
            padding:const EdgeInsets.all(160.0),
            child:Text(
                "Place for table" //$val// countryforchart.text,


            )
        ),




      ],

    ),



  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(200, 255, 185, 220),
      appBar: AppBar(
        title: Text("TABLE DATA"),
        centerTitle: true,
      ),


      body: ListView(
        children: <Widget>[
          titleSection,
        ],
      ),
    );
  }
}