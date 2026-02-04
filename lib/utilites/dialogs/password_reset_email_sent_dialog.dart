import 'package:flutter/material.dart';
import 'package:my_app/utilites/dialogs/generice_dialog.dart';

Future<void> showPasswordResetSendDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: "Passoword Reset",
    content:
        "We Have now sent you a password reset link. Please check you email",
    optionsBuilder: () => {"OK": null},
  );
}
