import 'package:flutter/material.dart';

class SnackbarService {
  static GlobalKey<ScaffoldMessengerState> msgkey =
      GlobalKey<ScaffoldMessengerState>();

  static verSnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    msgkey.currentState!.showSnackBar(snackBar);
  }
}
