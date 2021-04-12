// Import the test package and Counter class
import 'package:flutter_app1/models/region.dart';
import 'package:flutter_app1/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiService', () {
    test('getting predictions body', () async {
      var apiService = ApiService();
      var body = await apiService.getPredictionsBody();
      expect(body.runtimeType, String);
    });

    test('getting region list', () async {
      var apiService = ApiService();
      var list = await apiService.getPredictionsList();

      print(list[0].region);
      print(list[0].predicted);
      print(list[1].outputs);

      expect(list[0].region.runtimeType, String);
    });

    test('datetime parsing', () async {
      var apiService = ApiService();
      var list = await apiService.getPredictionsList();

      print(list[0].outputs[0].date);

      expect(list[0].outputs[0].date.runtimeType, DateTime);
    });
  });
}
