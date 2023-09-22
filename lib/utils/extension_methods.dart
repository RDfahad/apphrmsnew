import 'package:flutter/material.dart';

extension ScreenConfig on BuildContext {
  double get getScreenWidth => MediaQuery.of(this).size.width;

  double get getScreenHeight => MediaQuery.of(this).size.height;

  Color get getMainColor => Theme.of(this).primaryColor;

  Color get getSecondaryColor => Theme.of(this).colorScheme.secondary;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
extension DateParsingExtension on String {
  Duration difference(String otherDate) {
    DateTime startDate = DateTime.parse(this);
    DateTime endDate = DateTime.parse(otherDate);
    return startDate.difference(endDate);
  }
}



