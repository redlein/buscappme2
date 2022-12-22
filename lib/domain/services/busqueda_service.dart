import 'dart:convert';

import 'package:buscappme/domain/models/busqueda_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusquedaService with ChangeNotifier {
  final String baseUrl = 'https://actividad8-d213f-default-rtdb.firebaseio.com';
  final List<Busqueda> busquedas = [];
  late Busqueda seleccionarBusqueda;

  bool isLoading = true;
  bool isSaving = false;

  BusquedaService() {
    listarBusquedas();
  }

  String urlbase = 'https://tfscdnfyqymsvuhirhdi.supabase.co/rest/v1/busquedas';

  String keydb = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmc2NkbmZ5cXltc3Z1aGlyaGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MzI4NjEsImV4cCI6MTk4NzIwODg2MX0._Gwnv4hM69kBd_ai_dQ3TmpJ2Xl1rmNQvuoDpD24xIE';


  //LISTAR LUGARES
  Future<List<Busqueda>> listarBusquedas() async {
    isLoading = true;
    notifyListeners();

     Map<String, String> header = {
      'apikey': keydb,
      'Authorization': "Bearer $keydb",
    };

    final url = Uri.parse("$urlbase?select=*");
    final response = await http.get(url, headers: header);
    print(response.body);
    final List<dynamic> busquedasMap = json.decode(response.body);

    for (var value in busquedasMap) {
      final busquedaTemporal = Busqueda.fromMap(value);
      busquedas.add(busquedaTemporal);
    }

    isLoading = false;
    notifyListeners();
    return busquedas;
  }

  Future<String> guardarDB(BuildContext context, Busqueda busqueda) async {
    final url = Uri.parse(urlbase);
    final String msg;

    Map<String, String> header = {
      'apikey': keydb,
      'Authorization': "Bearer $keydb",
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final response = await http.post(url, body: busqueda.toJson(), headers: header);

    if (response.statusCode != 201) {
      msg = 'NO SE GUARDÓ CORRECTAMENTE';
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
            size: 100,
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('true');
              },
              child: const Text('Aceptar'),
            )
          ],
        ),
      );
    } else {
      msg = 'SE GUARDÓ CORRECTAMENTE';
      // storageProvider.subirImageStorage();
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.check,
            color: Colors.amber,
            size: 100,
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('true');
              },
              child: const Text('Aceptar'),
            )
          ],
        ),
      );
    }
    
    busquedas.add(busqueda);
    notifyListeners();

    return msg;
  }

  //nuevo
  //=======================================================

  void alertCustom(BuildContext context, Busqueda busqueda) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Icon(
          Icons.notification_important,
          color: Colors.amber,
          size: 100,
        ),
        content: const Text(
          'Seguro de guardar?',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop('false'),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop('true'),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    ).then((value) => {
      if (value == 'true')
      {
        guardarDB(context, busqueda),
      }
    });
  }
}