import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '/ui/widgets/fl_charts/bar_data.dart';
import '/utils/app_color.dart';

class MyBarGraph extends StatelessWidget {
  final List<double> monthlySummary;

  const MyBarGraph({
    Key? key,
    required this.monthlySummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize Bar Data structure
    BarData myBarData = BarData(
      sunAmount: monthlySummary[0],
      monAmount: monthlySummary[1],
      tuesAmount: monthlySummary[2],
      wedAmount: monthlySummary[3],
      thursAmount: monthlySummary[4],
      friAmount: monthlySummary[5],
      satAmount: monthlySummary[6],
    );
    myBarData.initialize();
    const style = TextStyle(
      fontSize: 15,
      color: AppColor.secondaryTextColor,
    );
    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 9,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, title) {
                switch (value.toInt()) {
                  case 0:
                    return const Text("0h", style: style);
                  case 2:
                    return const Text("2h", style: style);
                  case 4:
                    return const Text("4h", style: style);
                  case 6:
                    return const Text("6h", style: style);
                  default:
                    return const Text("");
                }
              },
              reservedSize: 20,
            ),
          ),
          leftTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
              reservedSize: 30,
            ),
          ),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: AppColor.primaryColor,
                    width: 25,
                    borderRadius: BorderRadius.circular(15),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      color: Colors.grey[200],
                      toY: 8,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 15,
    color: Colors.black,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text("Sun", style: style);
      break;

    case 1:
      text = const Text("Mon", style: style);
      break;

    case 2:
      text = const Text("Tue", style: style);

      break;

    case 3:
      text = const Text("Wed", style: style);

      break;
    case 4:
      text = const Text("Thur", style: style);

      break;
    case 5:
      text = const Text("Fri", style: style);

      break;
    case 6:
      text = const Text("Sat", style: style);

      break;
    default:
      text = const Text("", style: style);

      break;
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
