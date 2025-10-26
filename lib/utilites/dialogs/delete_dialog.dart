import 'package:flutter/material.dart';
import 'package:my_app/utilites/dialogs/generice_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "Delete",
    content: "Are you sure you want to delete this note?",
    optionsBuilder: () => {"Cancel": false, "Yes": true},
  ).then((value) => value ?? false);
}
