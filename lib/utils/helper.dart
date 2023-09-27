import 'package:flutter/material.dart';

import '/utils/extension_methods.dart';

class Helper {
  static calculateWorkingHours(
      {String? startTime, String? endTime, String? date}) {
    var difference = '${date ?? ''} ${startTime ?? ''}'
        .difference('${date ?? ''} ${endTime ?? '20:29:55'}');
    return '${difference.inHours}: ${(difference.inMinutes % 60).toString().padLeft(2, '0')}';
  }
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
