import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/services/api_service.dart';
import 'package:flutter_app1/singleton/data_state.dart';
import 'models/output.dart';
import 'strings.dart';

class ShowTableFragment extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final DateTime selectedDate;

  ShowTableFragment({Key? key, required this.selectedDate}) : super(key: key);

  @override
  _ShowTableFragmentState createState() => _ShowTableFragmentState();
}

class _ShowTableFragmentState extends State<ShowTableFragment> {
  List<DataRow> _rows = <DataRow>[];

  /// * * * * * * GET OUTPUT AT DATE * * * * * *
  Output getOutputAtDate(DateTime date, List<Output> outputs) {
    for (var o in outputs) {
      if (o.date.year == date.year &&
          o.date.month == date.month &&
          o.date.day == date.day) {
        return o;
      }
    }
    throw Exception('There are no output at given date');
  }

  bool dateExists(DateTime date, List<Output> outputs) {
    for (var o in outputs) {
      if (o.date.year == date.year &&
          o.date.month == date.month &&
          o.date.day == date.day) {
        return true;
      }
    }
    return false;
  }

  /// * * * * * * GENERATE TABLE * * * * * *
  void generateTable() {
    var predictions = DataState.predictionList;
    var reals = DataState.realList;
    var rows = <DataRow>[];

    if (!dateExists(widget.selectedDate, predictions.first.outputs) ||
        !dateExists(widget.selectedDate, reals.first.outputs)) return;

    // Iterate over all regions (prediction and real)
    for (var i = 0; i < predictions.length; i++) {
      var predictedCases =
          getOutputAtDate(widget.selectedDate, predictions[i].outputs).cases;
      var realCases =
          getOutputAtDate(widget.selectedDate, reals[i].outputs).cases;

      // Create row with given values
      var dataRow = DataRow(
        color: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.white;
        }),
        cells: [
          DataCell(Text(predictions[i].region,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.black))),
          DataCell(Text(predictedCases.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.green))),
          DataCell(Text(realCases.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.red))),
        ],
      );
      rows.add(dataRow);
    }

    setState(() {
      _rows = rows;
    });
  }

  /// * * * * * * INIT STATE * * * * * *
  @override
  void initState() {
    generateTable();
    super.initState();
  }

  /// * * * * * * BUILD * * * * * *
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      Strings.seventhtext,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: new Color(0xFFB71C1C),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(0.01),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue),
                      columnSpacing: 30.0,
                      showBottomBorder: true,
                      columns: [
                        DataColumn(
                          label: Text(
                            "Country:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                          tooltip: "Countries with covid data",
                        ),
                        DataColumn(
                            label: Text(
                              "Predicted cases:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                            tooltip: "Prediction of covid amount infection"),
                        DataColumn(
                            label: Text(
                              "Real cases:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                            tooltip: "Reality of covid amount infection"),
                      ],
                      rows: _rows,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
