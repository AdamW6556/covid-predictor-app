import 'dart:convert';
import 'package:flutter_app1/models/region.dart';
import 'package:http/http.dart' as http;

class ApiService {
  /// Fetch data from API and returns response body
  Future<String> getPredictionsBody() async {
    final uri = Uri.http('localhost:3000', '/api/predictions');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Unable to perform request!');
    }
  }

  /// Fetch data from API and returns list of Region model
  Future<List<Region>> getPredictionsList() async {
    final uri = Uri.http('localhost:3000', '/api/predictions');
    final response = await http.get(uri);
    final regionList = <Region>[];

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      for (var regJson in json) {
        var region = Region.fromJson(regJson);
        regionList.add(region);
      }

      return regionList;
    } else {
      throw Exception('Unable to perform request!');
    }
  }
}
