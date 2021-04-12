// Import the test package and Counter class
import 'package:flutter_app1/models/output.dart';
import 'package:flutter_app1/models/region.dart';
import 'package:flutter_app1/services/api_service.dart';
import 'package:flutter_app1/singleton/data_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DataState', () {
    test('fetching API and edit singleton', () async {
      var apiService = ApiService();

      print(DataState.predictionList);

      DataState.predictionList = await apiService.getPredictionsListTest();
      DataState.realList = await apiService.getRealListTest();

      print(DataState.predictionList);

      expect(DataState.predictionList.isEmpty, false);
    });
  });
}
