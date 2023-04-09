import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailCaptorAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail du capteur"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SfCartesianChart(
              legend: Legend(isVisible: true),
              title: ChartTitle(text: "Historique d'allumage"),
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                  isInversed: false,
                  maximum: 7,
                  interval: 1,
                  labelFormat: 'J-{value}',
                  majorGridLines: const MajorGridLines(width: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.none),
              primaryYAxis: NumericAxis(
                  labelFormat: '{value}',
                  interval: 2,
                  maximum: 16,
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0)),
              tooltipBehavior: TooltipBehavior(enable: true),
            ),
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              title: ChartTitle(text: "Historique de détections"),
              legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap),
              primaryXAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  labelFormat: 'J-{value}',
                  interval: 1,
                  maximum: 7,
                  majorGridLines: const MajorGridLines(width: 0)),
              primaryYAxis: NumericAxis(
                  labelFormat: '{value}',
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(color: Colors.transparent)),
              tooltipBehavior: TooltipBehavior(enable: true),
            )
          ],
        ),
      ),
    );
  }
}
