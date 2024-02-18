import 'package:flutter/material.dart';

void showtoast(GlobalKey<ScaffoldState> _scaffoldKey, String text) {
  ScaffoldMessenger.of(_scaffoldKey.currentContext as BuildContext)
      .showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
