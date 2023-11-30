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

double covertTimeInToHours(String timeString) {
 
  List<String> timeParts = timeString.split(':');

  int hours = int.parse(timeParts[0]);
  int minutes = int.parse(timeParts[1]);
  int seconds = int.parse(timeParts[2]);

  // Convert to hours
  return hours + (minutes / 60) + (seconds / 3600);
}

void nextScreenReplaceCupertino(context, page) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => page));
}

void nextScreenCupertino(context, page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}
