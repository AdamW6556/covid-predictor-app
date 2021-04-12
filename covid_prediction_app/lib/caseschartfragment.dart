import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/models/output.dart';
import 'package:flutter_app1/singleton/data_state.dart';
import 'package:flutter_app1/widgets/line_titles.dart';
import 'strings.dart';

class CasesChartFragment extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CasesChartFragment({Key? key}) : super(key: key);

  @override
  _CasesChartFragmentState createState() => _CasesChartFragmentState();
}

class _CasesChartFragmentState extends State<CasesChartFragment> {
  String selectedRegion = '';

  final xValues = <int>[];
  final yValues = <int>[];

  /// * * * * * * GET PREDICTION OUTPUTS AT REGION * * * * * * //
  List<FlSpot> createFlSpotFromPredictions() {
    var spots = <FlSpot>[];

    for (var p in DataState.predictionList) {
      if (p.region == selectedRegion) {
        for (var o in p.outputs) {
          var mil = o.date.millisecondsSinceEpoch;
          var flSpot = FlSpot(mil.toDouble(), o.cases.toDouble());
          spots.add(flSpot);
          xValues.add(mil);
          yValues.add(o.cases);
        }
      }
    }

    return spots;
  }

  /// * * * * * * GET REAL OUTPUTS AT REGION * * * * * * //
  // List<FlSpot> getRealOutputsAtRegion() {
  //
  // }

  @override
  Widget build(BuildContext context) {
    var spots = createFlSpotFromPredictions();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("CASES CHART"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        selectedRegion = val;
                        print(selectedRegion);
                      });
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search countries...",
                      hintStyle: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                      //border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF4CAF50), width: 3.0),
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                      focusColor: Colors.green,
                      hoverColor: Colors.green,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Country fault';
                      }
                      return null;
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Container(
                  color: Colors.white,
                  height: 500.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: spots.isNotEmpty
                        ? LineChart(
                            LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                  spots: spots,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    colors: [
                                      Colors.red.withOpacity(0.2),
                                    ],
                                  ),
                                  dotData: FlDotData(show: true),
                                ),
                              ],
                              borderData: FlBorderData(
                                show: true,
                              ),
                              titlesData: FlTitlesData(
                                show: true,

                                /// * * * BOTTOM TITLES * * *
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 22,
                                  getTitles: (value) {
                                    var date =
                                        DateTime.fromMillisecondsSinceEpoch(
                                            value.toInt());

                                    if (date.day == 21) return '${date.month}';
                                    return '';
                                  },
                                  getTextStyles: (value) => const TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.black,
                                  ),
                                ),

                                /// * * * LEFT TITLES * * *
                                leftTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 22,
                                  getTitles: (value) {
                                    if (yValues.contains(value.toInt())) {
                                      return value.toInt().toString();
                                    } else {
                                      return '';
                                    }
                                  },
                                  getTextStyles: (value) => const TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Text('Selected region does not exist!'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
