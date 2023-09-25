import 'generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showCannotEmptyDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Sharing',
    content: "You cannot share empty notes!",
    optionBuilder: () => {
      'OK': null,
    },
  );
}
