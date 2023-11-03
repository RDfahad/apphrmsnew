import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ScreenConfig on BuildContext {
  double get getScreenWidth => MediaQuery.of(this).size.width;

  double get getScreenHeight => MediaQuery.of(this).size.height;

  Color get getMainColor => Theme.of(this).primaryColor;

  Color get getSecondaryColor => Theme.of(this).colorScheme.secondary;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get getFontText => Theme.of(this).textTheme;
}

extension DateParsingExtension on String {
  Duration difference(String otherDate) {
    DateTime startDate = DateTime.parse(this);
    DateTime endDate = DateTime.parse(otherDate);
    return endDate.difference(startDate);
  }
}

void nextScreenReplaceCupertino(context, page) {
  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => page));
}

void nextScreenCupertino(context, page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}
