import 'package:flutter_app1/models/region.dart';
import 'package:flutter_app1/services/api_service.dart';

class DataState {
  static final DataState _instance = DataState._internal();
  static List<Region> predictionList = <Region>[];
  static List<Region> realList = <Region>[];

  factory DataState() {
    return _instance;
  }

  DataState._internal() {
    print('created');
  }
}
