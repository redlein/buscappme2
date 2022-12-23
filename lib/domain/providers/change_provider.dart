import 'package:flutter/material.dart';

class ChangeProvider with ChangeNotifier {
  bool datoT = false;
  bool dato = false;
  bool dato2 = false;

  bool isEmpty = false;

  bool get isChange => dato;

  cambiarT(bool value) {
    datoT = value;
    print(value);
    notifyListeners();
  }

  cambiar(bool value) {
    dato = value;
    print(value);
    notifyListeners();
  }

  cambiar2(bool value) {
    dato2 = value;
    print(value);
    notifyListeners();
  }

  // Alerta
  btnMostrarAlerta() {
    (dato == false && dato2 == false && datoT == false)
        ? (isEmpty = true)
        : (isEmpty = false);

    notifyListeners();
  }
}
