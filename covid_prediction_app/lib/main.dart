import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/services/api_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'strings.dart';
import 'worldmapmain.dart';
import 'tablemainfragment.dart';
import 'showmapfragment.dart';
import 'showtablefragment.dart';
import 'caseschartfragment.dart';

void main() {
  runApp(CovidApp());
}

class CovidApp extends StatefulWidget {
  @override
  _CovidAppState createState() => _CovidAppState();
}

class _CovidAppState extends State<CovidApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to fetch data from API
  void fetchApiData() async {
    final apiService = ApiService();

    try {
      // Wait for loading data
      var predictionList = await apiService.getPredictionsListTest();
      print(predictionList);
      setState(() => _initialized = true);
    } catch (e) {
      print(e);
      // Set `_error` state to true if fetching data was failure
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    fetchApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if fetching failed
    if (_error) {
      return ErrorAppWidget();
    }

    // Show a loader until data is fetching
    if (!_initialized) {
      return LoadingAppWidget();
    }

    return MaterialAppWidget();
  }
}

class ErrorAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SpinKitRotatingCircle(
        size: 50.0,
        color: Colors.blue,
      ),
    );
  }
}

class LoadingAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SpinKitRotatingCircle(
        size: 50.0,
        color: Colors.blue,
      ),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID Prediction App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainFragment(),
    );
  }
}

//main menu fragment
class MainFragment extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  MainFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.firsttext,
                style: TextStyle(
                  color: new Color(0xFF0D47A1),
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              )),
          Center(
            child: Image.asset('images/virusicon.png', height: 130, width: 130),
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                Strings.secondtext,
                style: TextStyle(
                  color: new Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WorldMapMainFragment()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.green,
                elevation: 20,
                minimumSize: Size(300, 70),
              ),
              child: Text('WORLD MAP',
                  style: TextStyle(
                    color: new Color(0xFF0277BD),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CasesChartFragment()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.green,
                elevation: 20,
                minimumSize: Size(300, 70),
              ),
              child: Text('CASES CHART',
                  style: TextStyle(
                    color: new Color(0xFF0277BD),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TableMainFragment()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.green,
                elevation: 20,
                minimumSize: Size(300, 70),
              ),
              child: Text('CASES TABLE',
                  style: TextStyle(
                    color: new Color(0xFF0277BD),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  )),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Color.fromARGB(200, 255, 185, 220),
        key: _scaffoldKey,
        drawer: NavDrawer(),
        appBar: AppBar(
          title: const Text('MAIN MENU'),
          centerTitle: true,
          leading: GestureDetector(
            child: IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Show bottom nav',
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                }),
          ),
        ),
        body: ListView(
          children: <Widget>[titleSection],
        ));
  }
}

//bottom navigation
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'IMPORTANT INFORMATION\n ABOUT\n CORONAVIRUS',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('Images/protection.png'))),
          ),
          ListTile(
              leading: Icon(Icons.verified_user),
              title: Text(
                'www.gov.pl',
                textScaleFactor: 1.2,
              ),
              selectedTileColor: Color.fromARGB(100, 10, 180, 80),
              tileColor: Color.fromARGB(190, 10, 255, 72),
              onTap: () {}),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text(
              'www.who.int',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(200, 190, 85, 172),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.warning_amber_outlined),
            title: Text(
              'www.nhs.uk',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(190, 10, 255, 72),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'www.msn.com',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(200, 190, 85, 172),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.perm_device_info),
            title: Text(
              'www.gov.uk',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(190, 10, 255, 72),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.insert_drive_file_outlined),
            title: Text(
              'www.covid19.nih.gov',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(200, 190, 85, 172),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.ad_units),
            title: Text(
              'www.cdc.gov',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(190, 10, 255, 72),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.where_to_vote_outlined),
            title: Text(
              'www.edition.cnn.com',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(200, 190, 85, 172),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.where_to_vote_rounded),
            title: Text(
              'www.sbcovid19.com',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(190, 10, 255, 72),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.image_aspect_ratio_outlined),
            title: Text(
              'www.onet.com',
              textScaleFactor: 1.2,
            ),
            tileColor: Color.fromARGB(200, 190, 85, 172),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
