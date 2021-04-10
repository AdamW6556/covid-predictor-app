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
    child: Column(
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
              ),
            )
        ),

        Padding(
            padding:const EdgeInsets.all(0.01),

           child: SingleChildScrollView(

             scrollDirection: Axis.horizontal,

             child: DataTable(
               headingRowColor:
               MaterialStateColor.resolveWith((states) => Colors.blue),
                  columnSpacing: 30.0,
                  showBottomBorder: true,

               columns: [

                  DataColumn(label: Text("Country:",style: TextStyle(fontWeight:FontWeight.bold,fontSize:17.0,fontStyle: FontStyle.italic,color:Colors.white),),tooltip: "Countries with covid data",),
                  DataColumn(label: Text("Predicted cases:",style: TextStyle(fontWeight:FontWeight.bold,fontSize:17.0,fontStyle: FontStyle.italic,color:Colors.white),),tooltip: "Prediction of covid amount infection"),
                  DataColumn(label: Text("Real cases:",style: TextStyle(fontWeight:FontWeight.bold,fontSize:17.0,fontStyle: FontStyle.italic,color:Colors.white),),tooltip: "Reality of covid amount infection"),
               ],

               rows: [

                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                     cells: [
                       DataCell(Text("Afghanistan",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                       DataCell(Text("30190",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                       DataCell(Text("28423",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                 ],
                 ),
                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Albania",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("1862",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("1890",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),

                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Alberta|Canada",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("8449",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("7672",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),
                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Alberta|Canada",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("8449",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("7672",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),
                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Alberta|Canada",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("8449",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("7672",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),
                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Alberta|Canada",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("8449",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("7672",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),
                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Alberta|Canada",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("8449",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("7672",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),
                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Alberta|Canada",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("8449",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("7672",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),
                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Alberta|Canada",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("8449",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("7672",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),
                 DataRow(
                   color: MaterialStateProperty.resolveWith<Color>(
                           (Set<MaterialState> states) {
                         return Colors.white;
                       }),
                   cells: [
                     DataCell(Text("Alberta|Canada",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.black))),
                     DataCell(Text("8449",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.green))),
                     DataCell(Text("7672",style:TextStyle(fontWeight: FontWeight.bold,fontSize:16.0,color: Colors.red))),
                   ],
                 ),


               ],
             ),

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