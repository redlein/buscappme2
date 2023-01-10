import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formRegisterkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String nombres = '';
  String apellidos = '';
  String phone = '';
  int tipoUsuario = 0;

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
    } else if (input == 'nombres') {
      nombres = value;
    } else if (input == 'apellidos') {
      apellidos = value;
    } else if (input == 'phone') {
      phone = value;
    }
  }
}
