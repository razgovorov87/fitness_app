import 'package:fitness_app/presentation/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsTab extends StatefulWidget {
  const StatsTab({Key? key}) : super(key: key);

  @override
  State<StatsTab> createState() => _StatsTabState();
}

final chartData = <ChartData>[
  ChartData(0, 15),
  ChartData(1, 60),
  ChartData(2, 55),
  ChartData(3, 40),
  ChartData(4, 60),
  ChartData(5, 80),
  ChartData(6, 90),
  ChartData(7, 76)
];

class _StatsTabState extends State<StatsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: SfCartesianChart(
        plotAreaBorderColor: Colors.transparent,
        primaryXAxis: NumericAxis(
          plotOffset: 2,
          interval: 1,
          axisLine: const AxisLine(
            color: Colors.transparent,
          ),
          majorGridLines: const MajorGridLines(
            color: Colors.transparent,
          ),
          tickPosition: TickPosition.inside,
          labelStyle: GoogleFonts.dmSans(
            color: const Color(0xFF78849E),
            fontSize: 14,
          ),
        ),
        primaryYAxis: NumericAxis(
          plotOffset: 2,
          majorTickLines: const MajorTickLines(
            color: Colors.transparent,
          ),
          labelStyle: GoogleFonts.dmSans(
            color: const Color(0xFF78849E),
            fontSize: 14,
          ),
          interval: 25,
          majorGridLines: const MajorGridLines(
            color: Color(0xFF353A50),
          ),
          axisLine: const AxisLine(
            color: Colors.transparent,
          ),
        ),
        series: <ChartSeries>[
          SplineAreaSeries<ChartData, int>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            animationDuration: 1500,
            borderWidth: 2,
            borderColor: CustomColors.primary,
            gradient: LinearGradient(
              colors: [
                CustomColors.primary.withOpacity(0.5),
                CustomColors.primary.withOpacity(0.3),
                Colors.transparent,
              ],
              stops: const [0, 0.5, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
