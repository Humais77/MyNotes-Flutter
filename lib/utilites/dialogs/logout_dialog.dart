import 'package:flutter/material.dart';
import 'package:my_app/utilites/dialogs/generice_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: "log out",
    content: "Are you sure you want to log out?",
    optionsBuilder: () => {"Cancel": false, "Log out": true},
  ).then((value) => value ?? false);
}
