import 'package:flutter_app1/services/service_helper.dart';

import 'output.dart';

class Region {
  final String region;
  final double lat;
  final double long;
  final bool predicted;
  final List<Output> outputs;

  Region(
      {required this.region,
      required this.lat,
      required this.long,
      required this.predicted,
      required this.outputs});

  factory Region.fromJson(Map<String, dynamic> json) {
    final outputs = json['outputs']
        .cast<Map<String, dynamic>>()
        .map<Output>((json) => Output.fromJson(json))
        .toList();

    return Region(
      region: json['region'],
      lat: double.parse(json['lat']),
      long: double.parse(json['long']),
      predicted: json['predicted'],
      outputs: outputs,
    );
  }
}
