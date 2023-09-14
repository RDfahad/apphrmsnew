import 'package:flutter/material.dart';
import '/ui/widgets/fl_charts/bar_graph.dart';

class HomeChart extends StatefulWidget {
  const HomeChart({super.key});

  @override
  State<HomeChart> createState() => _HomeChartState();
}

class _HomeChartState extends State<HomeChart> {
  List<double> monthlySummary = [
    45.0,
    92.0,
    60.0,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          width: 300,
          child: MyBarGraph(monthlySummary: monthlySummary),
        ),
      ),
    );
  }
}
