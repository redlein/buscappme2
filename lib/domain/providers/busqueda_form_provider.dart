
import 'package:buscappme/domain/models/busqueda_model.dart';
import 'package:flutter/cupertino.dart';

class BusquedaFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Busqueda busqueda;
  BusquedaFormProvider(this.busqueda);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
