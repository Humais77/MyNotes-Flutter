import 'package:flutter/material.dart';
import 'package:my_app/utilites/dialogs/generice_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog(
    context: context,
    title: "An error occurred",
    content: text,
    optionsBuilder: () => {"OK": null},
  );
}
