import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'strings.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_app1/services/api_service.dart';
// import 'package:flutter_app1/singleton/data_state.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'strings.dart';
// import 'worldmapmain.dart';
// import 'tablemainfragment.dart';
// import 'showmapfragment.dart';
// import 'showtablefragment.dart';
// import 'caseschartfragment.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'CovidRules.dart';




class CovidRulesFragment extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CovidRulesFragment({Key? key}) : super(key: key);

  @override
  _CovidRulesFragmentState createState()=>_CovidRulesFragmentState();
}

class _CovidRulesFragmentState extends State<CovidRulesFragment> {


  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      child:Column(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

        Padding(
        padding:const EdgeInsets.all(15.0),
         child:Text(
            Strings.tenthtext,
             style:TextStyle(
             color: new Color(0xFF0D47A1),
              fontWeight:FontWeight.bold,
              fontSize: 30.0,
            //backgroundColor: new Color(0xFFFF7043)
           ),
          )
      ),

            Padding(
                padding:const EdgeInsets.all(15.0),
                child:Text(
                  Strings.eltext,
                  style:TextStyle(
                    color: new Color(0xFFB71C1C),
                    fontWeight:FontWeight.bold,
                    fontSize: 20.0,
                    //backgroundColor: new Color(0xFFFF7043)
                  ),
                )
            ),



            Padding(padding: const EdgeInsets.all(20.0),

              child:  ElevatedButton.icon(
                  onPressed: () {
                    setState((){
                      const url='https://www.gov.pl/web/koronawirus/wlasnie-otrzymalem-pozytywny-wynik-testu';
                      launch(url);
                    });
                  },

                  style: ElevatedButton.styleFrom(
                    primary:Colors.orange,
                    onPrimary: Colors.white,
                    elevation: 20,
                    minimumSize: Size(200,70),
                  ),
                  label: Text('COVID TEST POSITIVE',
                      style:TextStyle(
                        color: new Color(0xFFFFFFFF),
                        fontWeight:FontWeight.bold,
                        fontSize: 25.0,

                      )
                  ),  icon: const Icon(Icons.coronavirus)
              ),
            ),


            Padding(padding: const EdgeInsets.all(15.0),

              child:  ElevatedButton.icon(
                  onPressed: () {
                    setState((){

                      const url='https://www.gov.pl/web/koronawirus/mam-koronawirusa-i-jestem-w-izolacji-domowej';
                      launch(url);
                      //Navigator.push(context,new MaterialPageRoute(builder: (context) => IsolHomeFragment()),
                     // );
                     }
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    primary:Colors.orange,
                    onPrimary: Colors.white,
                    elevation: 20,
                    minimumSize: Size(200,70),
                  ),
                  label: Text('HOME ISOLATION PRINCIPLES',
                      style:TextStyle(
                        color: new Color(0xFFFFFFFF),
                        fontWeight:FontWeight.bold,
                        fontSize: 18.0,

                      )
                  ),  icon: const Icon(Icons.home)
              ),
            ),

            Padding(
                padding:const EdgeInsets.all(10.0),
                child:Text(
                  Strings.tvtext,
                  style:TextStyle(
                    color: new Color(0xFF1B5E20),
                    fontWeight:FontWeight.bold,
                    fontSize: 20.0,
                    //backgroundColor: new Color(0xFFFF7043)
                  ),
                )

            ),

            Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('images/predctcovid.png', height: 400, width: 400),
                      height: 250,
                      width: double.infinity,
                      //fit: BoxFit.cover,
                    ),
                ]
            )

          ]
      ),

    );

    return Scaffold(
        backgroundColor:Color.fromARGB(200, 136, 212, 156),

        appBar: AppBar(
          title: const Text('RULES AGAINST COVID'),
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