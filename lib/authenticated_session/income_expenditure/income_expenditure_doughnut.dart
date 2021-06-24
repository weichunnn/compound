import 'package:compound/constants.dart';
import 'package:compound/size_config.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeExpenditureDoughnut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(315),
      child: SfCircularChart(
        annotations: [
          CircularChartAnnotation(
            widget: Container(
                child: Text(
              '\$ 3060',
              style: TextStyle(
                color: kSuccessColor,
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ],
        legend: Legend(
          position: LegendPosition.bottom,
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        series: _getDefaultDoughnutSeries(),
      ),
    );
  }

  /// Returns the doughnut series which need to be render.
  List<DoughnutSeries<ChartSampleData, String>> _getDefaultDoughnutSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'Salary', y: 55, text: '55%'),
      ChartSampleData(x: 'Medium', y: 31, text: '31%'),
      ChartSampleData(x: 'Stocks', y: 7.7, text: '7.7%'),
      ChartSampleData(x: 'Others', y: 1.4, text: '14%'),
    ];
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        dataSource: chartData,
        explode: true,
        radius: '85%',
        pointRadiusMapper: (ChartSampleData data, _) {
          if (data.y == 55) return '100%';
        },
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.text,
        dataLabelSettings: DataLabelSettings(isVisible: false),
      )
    ];
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.y, this.text});
  final String x;
  final double y;
  final String text;
}
