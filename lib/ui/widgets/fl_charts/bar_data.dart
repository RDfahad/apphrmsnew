import '/ui/widgets/fl_charts/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tuesAmount;
  final double wedAmount;
  final double thursAmount;
  final double friAmount;
  final double satAmount;

  List<Individual> barData = [];

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tuesAmount,
    required this.wedAmount,
    required this.thursAmount,
    required this.friAmount,
    required this.satAmount,
  });

  //initialize bar data
  void initialize() {
    barData = [
      Individual(x: 0, y: sunAmount),
      Individual(x: 1, y: monAmount),
      Individual(x: 2, y: tuesAmount),
      Individual(x: 3, y: wedAmount),
      Individual(x: 4, y: thursAmount),
      Individual(x: 5, y: friAmount),
      Individual(x: 6, y: satAmount),
    ];
  }
}
