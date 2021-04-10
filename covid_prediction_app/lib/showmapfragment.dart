import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'strings.dart';

class ShowMapFragment extends StatefulWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ShowMapFragment({Key? key}) : super(key: key);

  @override
  _ShowMapFragmentState createState()=>_ShowMapFragmentState();

}

class _ShowMapFragmentState extends State<ShowMapFragment> {

  Widget titleSection = Container(
    child:Column(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
            padding:const EdgeInsets.all(20.0),
            child:Text(
              Strings.sixthtext,
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
                "Place for map" //$val// countryforchart.text,


            )
        ),

        Padding(padding: const EdgeInsets.all(50.0),

          child:  ElevatedButton.icon(
              onPressed: () {
                //setState(() {

               // });

              },

              style: ElevatedButton.styleFrom(
                primary:Colors.blueAccent,
                onPrimary: Colors.white,
                elevation: 20,
                minimumSize: Size(250,70),
              ),
              label: Text('REAL DATA',
                  style:TextStyle(
                    color: new Color(0xFFFFFF00),
                    fontWeight:FontWeight.bold,
                    fontSize: 25.0,

                  )
              ),  icon: const Icon(Icons.airplay_sharp)
          ),
        ),

        Padding(padding: const EdgeInsets.all(5.0),

          child:  ElevatedButton.icon(
              onPressed: () {
                //setState(() {

                // });

              },

              style: ElevatedButton.styleFrom(
                primary:Colors.blueAccent,
                onPrimary: Colors.white,
                elevation: 20,
                minimumSize: Size(60,70),
              ),
              label: Text('PREDICTED DATA',
                  style:TextStyle(
                    color: new Color(0xFFFFFF00),
                    fontWeight:FontWeight.bold,
                    fontSize: 25.0,

                  )
              ),  icon: const Icon(Icons.add_to_queue_sharp)
          ),
        ),
      ],

    ),



  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(200, 255, 185, 220),
      appBar: AppBar(
        title: Text("MAP DATA"),
        centerTitle: true,
      ),
      body:ListView(
      children: <Widget>[
      titleSection,
      ],
     ),
    );
  }
}