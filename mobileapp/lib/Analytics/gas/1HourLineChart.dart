import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:mobileapp/Analytics/gas/gas1HourData.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<HourGasData> points;

  const LineChartWidget(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(lineBarsData: [
        LineChartBarData(
          spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
          isCurved: false,
          dotData: FlDotData(show: true)
        )
      ])),
    );
  }
}