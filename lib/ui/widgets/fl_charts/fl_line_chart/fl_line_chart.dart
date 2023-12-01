import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../../../utils/app_color.dart';

class FlLineChartScreen extends StatelessWidget {
  const FlLineChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 15,
      color: AppColor.secondaryTextColor,
    );
    return LineChart(

      LineChartData(
        borderData: FlBorderData(
            show: false, border: Border.all(color: Colors.black, width: 2)),
        gridData: FlGridData(
          drawHorizontalLine: true,
          show: true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(color: Colors.black26, strokeWidth: 0.5);
          },
          drawVerticalLine: false,
        ),
        titlesData: const FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getLeftTitles,
            reservedSize: 30,
          )),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles,
            reservedSize: 30,
          )),
        ),
        maxX: 8,
        maxY: 101,
        minY: 0,
        minX: 0,
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 10),
              const FlSpot(2, 20),
              const FlSpot(3, 55),
              const FlSpot(4, 33),
              const FlSpot(5, 30),
              const FlSpot(7, 66),
              const FlSpot(8, 4),
            ],
            isCurved: true,
            color: AppColor.primaryColor,
            barWidth: 2,
            belowBarData: BarAreaData(
                show: true,
                gradient: const SweepGradient(colors: [
                  Color.fromARGB(255, 207, 226, 253),
                  Color.fromARGB(255, 194, 215, 245),
                ],),),
          ),
        ],
      ),
    );
  }
}

Widget getLeftTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
  Widget text;
  switch (value.toInt()) {
    // case 0:
    //   text = const Text("0", style: style);
    case 20:
      text = const Text("20", style: style);
    case 40:
      text = const Text("40", style: style);
    case 60:
      text = const Text("60", style: style);
    case 80:
      text = const Text("80", style: style);
    case 100:
      text = const Text("100", style: style);
    default:
      text = const Text("", style: style);

      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    color: Colors.black,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text("Jan", style: style);
      break;

    case 1:
      text = const Text("Feb", style: style);
      break;

    case 2:
      text = const Text("Mar", style: style);

      break;

    case 3:
      text = const Text("Apr", style: style);

      break;
    case 4:
      text = const Text("May", style: style);

      break;
    case 5:
      text = const Text("Jun", style: style);

      break;
    case 6:
      text = const Text("Jul", style: style);

      break;
    case 7:
      text = const Text("Jul", style: style);

      break;
    default:
      text = const Text("", style: style);

      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
