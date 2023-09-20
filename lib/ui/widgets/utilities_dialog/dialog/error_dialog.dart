import 'package:flutter/material.dart';
import 'generic_dialog.dart';

Future<void> ShowErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
    context: context,
    title: "An error Ocuured",
    content: text,
    optionBuilder: () => {
      'OK': null,
    },
  );
}
