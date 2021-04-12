import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/services/api_service.dart';
import 'package:flutter_app1/showtablefragment.dart';
import 'strings.dart';

class TableMainFragment extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TableMainFragment({Key? key}) : super(key: key);

  @override
  _TableMainFragmentState createState() => _TableMainFragmentState();
}

class _TableMainFragmentState extends State<TableMainFragment> {
  DateTime _date = DateTime.now();

  /// * * * * * * SELECT DATE * * * * * *
  Future<Null> _selectDate(BuildContext context) async {
    var apiService = ApiService();
    var predictions = await apiService.getPredictionsListTest();

    DateTime _datepicker = (await showDatePicker(
      context: context,
      initialDate: predictions.first.outputs.first.date,
      // firstDate: DateTime(2020),
      // lastDate: DateTime(2030),
      firstDate: predictions.first.outputs.first.date,
      lastDate: predictions.first.outputs.last.date,
    ))!;

    if (_datepicker != null && _datepicker != _date) {
      setState(() {
        _date = _datepicker;
      });
    }
  }

  /// * * * * * * BUILD * * * * * *
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                Strings.fifthtext,
                style: TextStyle(
                  color: new Color(0xFF0D47A1),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  //backgroundColor: new Color(0xFFFF7043)
                ),
              )),

          /// * * * * * * PICK DATA BUTTON * * * * * *
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _selectDate(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  onPrimary: Colors.white,
                  elevation: 20,
                  minimumSize: Size(200, 70),
                ),
                label: Text('PICK DATA',
                    style: TextStyle(
                      color: new Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    )),
                icon: const Icon(Icons.apps_sharp)),
          ),
          // Padding(
          //     padding: const EdgeInsets.all(40.0),
          //     child: TextFormField(
          //       decoration: InputDecoration(
          //           labelText: "Data for table data:",
          //           hintText: (_date.toString()),
          //           focusedBorder: OutlineInputBorder(
          //               borderSide:
          //                   BorderSide(color: Color(0xFF33691E), width: 3.0))),
          //       onTap: () {
          //         setState(() {
          //           _selectDate(context);
          //         });
          //       },
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 25.0,
          //       ),
          //     )),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                Strings.ninthtext,
                style: TextStyle(
                  color: new Color(0xFF33691E),
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                  //backgroundColor: new Color(0xFFFF7043)
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                _date.toString(),
                style: TextStyle(
                    color: new Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,
                    backgroundColor: new Color(0xFFFFFF00)),
              )),

          /// * * * * * * SEE TABLE BUTTON * * * * * *
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowTableFragment(
                                selectedDate: _date,
                              )),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  onPrimary: Colors.white,
                  elevation: 20,
                  minimumSize: Size(200, 70),
                ),
                label: Text('SEE TABLE',
                    style: TextStyle(
                      color: new Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    )),
                icon: const Icon(Icons.table_chart_outlined)),
          ),
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Color.fromARGB(200, 255, 185, 220),
        appBar: AppBar(
          title: const Text('CASES TABLE'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            titleSection,
          ],
        ));
  }
}
