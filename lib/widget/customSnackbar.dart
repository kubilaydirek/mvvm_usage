// ignore_for_file: file_names

import 'package:flutter/material.dart';

/// Özelleştirilebilir SnackBar
showCustomSnacbar(BuildContext context, String message, Color color) {
  var snackBar = SnackBar(
    content: Text(message),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
