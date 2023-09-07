
import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
   double get getScreenWidth => MediaQuery.of(this).size.width;

   double get getScreenHeight => MediaQuery.of(this).size.height;

   Color get getMainColor => Theme.of(this).primaryColor;

   ColorScheme get colorScheme => Theme.of(this).colorScheme;
}