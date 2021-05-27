import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewChart extends StatefulWidget {
  @override
  _OverviewChartState createState() => _OverviewChartState();
}

class _OverviewChartState extends State<OverviewChart> {
  TrackballBehavior trackball;

  @override
  void initState() {
    trackball = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
      tooltipSettings: InteractiveTooltip(
        canShowMarker: false,
        format: '\t series.name: \$point.y',
      ),
      hideDelay: 2500,
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        interval: 6,
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.hide,
        labelAlignment: LabelAlignment.start,
        labelPosition: ChartDataLabelPosition.inside,
        labelStyle: TextStyle(height: 2),
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: _getSplieAreaSeries(),
      trackballBehavior: trackball,
    );
  }

  /// Returns the list of chart series
  /// which need to render on the spline area chart.
  List<ChartSeries<_SplineAreaData, double>> _getSplieAreaSeries() {
    final List<_SplineAreaData> chartData = <_SplineAreaData>[
      _SplineAreaData(2010, 20, 3),
      _SplineAreaData(2011, 9, 5),
      _SplineAreaData(2012, 10, 2),
      _SplineAreaData(2013, 9, 2),
      _SplineAreaData(2014, 5, 1),
      _SplineAreaData(2015, 4, 1),
      _SplineAreaData(2016, 4, 2),
      _SplineAreaData(2017, 3, 1),
      _SplineAreaData(2018, 3, 2),
      _SplineAreaData(2019, 3, 2),
      _SplineAreaData(2020, 3, 2),
      _SplineAreaData(2021, 3, 2),
      _SplineAreaData(2022, 3, 2),
    ];

    return <ChartSeries<_SplineAreaData, double>>[
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF25E49A).withOpacity(0.5),
            Colors.white,
          ],
        ),
        borderColor: Color(0xFF25E49A),
        borderWidth: 2,
        name: 'Income',
        xValueMapper: (_SplineAreaData sales, _) => sales.month,
        yValueMapper: (_SplineAreaData sales, _) => sales.y1,
      ),
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEA3942).withOpacity(0.5),
            Colors.white,
          ],
        ),
        borderColor: Color(0xFFEA3942),
        borderWidth: 2,
        name: 'Expenditure',
        xValueMapper: (_SplineAreaData sales, _) => sales.month,
        yValueMapper: (_SplineAreaData sales, _) => sales.y2,
      )
    ];
  }
}

/// Private class for storing the spline area chart datapoints.
class _SplineAreaData {
  _SplineAreaData(this.month, this.y1, this.y2);
  final double month;
  final double y1;
  final double y2;
}
