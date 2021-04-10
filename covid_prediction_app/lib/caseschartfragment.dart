import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'strings.dart';

class CasesChartFragment extends StatefulWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CasesChartFragment({Key? key}) : super(key: key);

  @override
  _CasesChartFragmentState createState()=>_CasesChartFragmentState();

}

class _CasesChartFragmentState extends State<CasesChartFragment> {

  //final _controller = TextEditingController();
   //late String val;

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      child:Column(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
              padding:const EdgeInsets.all(20.0),
              child:Text(
                Strings.fourthtext,
                style:TextStyle(
                  color: new Color(0xFF0D47A1),
                  fontWeight:FontWeight.bold,
                  fontSize: 30.0,
                  //backgroundColor: new Color(0xFFFF7043)
                ),
              )
          ),

          Padding(
              padding:const EdgeInsets.all(20.0),

            child:TextFormField(
              //controller: _controller,
              //onChanged: (val) {
              //  val = _controller.text.toString();
             // },
              style: TextStyle(
                color:Colors.white,
                fontWeight:FontWeight.bold,
                fontSize: 25.0,
              ),
              decoration: InputDecoration(
                hintText: "Search countries...",
                hintStyle: TextStyle(
                  fontSize: 25.0,
                  color:Colors.white,
                ),
                labelStyle: TextStyle(
                  fontSize: 25.0,
                  color:Colors.white,
                ),
                //border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF4CAF50),width: 5.0)),
                fillColor: Colors.grey,
                filled:true,
                focusColor: Colors.green,
                hoverColor: Colors.green,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Country fault';
                }
                return null;
              },
            )
          ),



          Padding(
              padding:const EdgeInsets.all(150.0),
              child:Text(
                "Place for chart" //$val// countryforchart.text,


              )
          ),






        ],

      ),

    );


    return Scaffold(
      backgroundColor: Color.fromARGB(200, 255, 185, 220),
      appBar: AppBar(
        title: Text("CASES CHART"),
        centerTitle: true,
      ),


      body: ListView(
        children: <Widget>[
          titleSection,
        ],
      )
    );
  }
}