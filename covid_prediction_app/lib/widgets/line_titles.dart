import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTitles: (value) {
            var date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
            return '${date.day}.${date.month}';
          },
          getTextStyles: (value) =>
              const TextStyle(fontSize: 15.0, color: Colors.black),
        ),
      );
}
