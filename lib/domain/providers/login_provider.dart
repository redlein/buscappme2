import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //validacion
  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }

  void setValueINput(value, input) {
    if (input == 'email') {
      email = value;
    } else if (input == 'password') {
      password = value;
    }
  }
}
