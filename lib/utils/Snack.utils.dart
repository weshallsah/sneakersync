import 'package:flutter/material.dart';

void showtoast(GlobalKey<ScaffoldState> _scaffoldKey, String text) {
  ScaffoldMessenger.of(_scaffoldKey.currentContext as BuildContext)
      .showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      // width: 250,
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.black87,
      content: Text(
        text,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 18,
        ),
      ),
    ),
  );
}
