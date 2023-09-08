// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:hr_emp_proj/ui/widgets/fl_charts/bar_data.dart';
// import 'package:hr_emp_proj/utils/app_color.dart';

// class MyBarGraph extends StatelessWidget {
//   final List monthlySummary;
//   const MyBarGraph({super.key, required this.monthlySummary});

//   @override
//   Widget build(BuildContext context) {
//     //initialize Bar Data structure
//     BarData myBarData = BarData(
//       sunAmount: monthlySummary[0],
//       monAmount: monthlySummary[1],
//       tuesAmount: monthlySummary[2],
//       wedAmount: monthlySummary[3],
//       thursAmount: monthlySummary[4],
//       friAmount: monthlySummary[5],
//       satAmount: monthlySummary[6],
//     );
//     myBarData.initialize();
//     return BarChart(
//       BarChartData(
//         //alignment: BarChartAlignment.spaceBetween,
//         minY: 0,
//         maxY: 9,
//         gridData: FlGridData(show: false),
//         borderData: FlBorderData(show: false),
//         titlesData: FlTitlesData(
//           show: true,
//           topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           rightTitles: AxisTitles(
//             sideTitles:
//                 SideTitles(showTitles: true, getTitlesWidget: getRightTitles),
//           ),
//           leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                   showTitles: true, getTitlesWidget: getBottomTitles)),
//         ),
//         barGroups: myBarData.barData
//             .map(
//               (data) => BarChartGroupData(
//                 x: data.x,
//                 barRods: [
//                   BarChartRodData(
//                     toY: data.y,
//                     color: AppColor.primaryColor,
//                     width: 25,
//                     borderRadius: BorderRadius.circular(5),
//                     backDrawRodData: BackgroundBarChartRodData(
//                       show: true,
//                       color: Colors.grey[200],
//                       toY: 10,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }

// Widget getRightTitles(double value, TitleMeta meta) {
//   const style = TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 12,
//     color: Colors.black,
//   );
//   Widget text;
//   switch (value.toInt()) {
//     case 0:
//       text = const Text("0", style: style);
//       break;

//     case 2:
//       text = const Text("2", style: style);
//       break;

//     case 4:
//       text = const Text("4", style: style);

//       break;

//     case 6:
//       text = const Text("8", style: style);

//       break;
//     default:
//       text = const Text("", style: style);

//       break;
//   }

//   return SideTitleWidget(child: text, axisSide: meta.axisSide);
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hr_emp_proj/ui/widgets/fl_charts/bar_data.dart';
import 'package:hr_emp_proj/utils/app_color.dart';

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
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: true),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, title) {
                switch (value.toInt()) {
                  case 0:
                    return Text(
                      "0h",
                      style: style,
                    );
                  case 2:
                    return Text(
                      "2h",
                      style: style,
                    );
                  case 4:
                    return Text(
                      "4h",
                      style: style,
                    );
                  case 6:
                    return Text(
                      "6h",
                      style: style,
                    );
                  default:
                    return Text("");
                }
              },
              reservedSize: 20,
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
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
                      toY: 10,
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
