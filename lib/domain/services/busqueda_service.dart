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
    busquedas.clear();
    notifyListeners();

     Map<String, String> header = {
      'apikey': keydb,
      'Authorization': "Bearer $keydb",
    };

    final url = Uri.parse("$urlbase?select=*");
    final response = await http.get(url, headers: header);
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
    print(busqueda.toJson());
    final response = await http.post(url, body: busqueda.toJson(), headers: header);

    if (response.statusCode != 201) {
      msg = 'NO SE GUARDÓ CORRECTAMENTE';
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogWidget(
          msg: msg, 
          icon: Icons.warning_amber_rounded,
          color: Colors.red
        )
      );
    } else {
      msg = 'SE GUARDÓ CORRECTAMENTE';
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogWidget(
          msg: msg, 
          icon: Icons.check,
          color: Colors.amber
        )
      );
    }
    
    busquedas.add(busqueda);
    notifyListeners();

    return msg;
  }

  Future<String> actualizarDB(BuildContext context, Busqueda busqueda) async {
    final url = Uri.parse(urlbase + "?id=eq.${busqueda.id}");
    final String msg;

    Map<String, String> header = {
      'apikey': keydb,
      'Authorization': "Bearer $keydb",
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final response = await http.patch(url, body: busqueda.toJson(), headers: header);
    print(response.statusCode);
    if (response.statusCode != 204) {
      msg = 'NO SE ACTUALIZÓ CORRECTAMENTE';
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogWidget(
          msg: msg, 
          icon: Icons.warning_amber_rounded, 
          color: Colors.red,
        ),
      );
    } else {
      msg = 'SE ACTUALIZÓ CORRECTAMENTE';
      // storageProvider.subirImageStorage();
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogWidget(
          msg: msg, 
          icon: Icons.check, 
          color: Colors.amber,
        ),
      );
    }
    
    final index = busquedas.indexWhere((element) => element.id == busqueda.id);
    busquedas[index] = busqueda;
    notifyListeners();

    return msg;
  }

  Future<String> eliminarBusqueda(BuildContext context, Busqueda busqueda) async {
    final url = Uri.parse(urlbase + "?id=eq.${busqueda.id}");
    final String msg;

    Map<String, String> header = {
      'apikey': keydb,
      'Authorization': "Bearer $keydb",
    };

    final response = await http.delete(url, headers: header);

    print(response.statusCode);
    if (response.statusCode != 204) {
      msg = 'NO SE ELIMINÓ CORRECTAMENTE';
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogWidget(
          msg: msg, 
          icon: Icons.warning_amber_rounded, 
          color: Colors.red,
        ),
      );
    } else {
      msg = 'SE ELIMINÓ CORRECTAMENTE';
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialogWidget(
          msg: msg, 
          icon: Icons.check, 
          color: Colors.amber,
        ),
      );
    }
    final index = busquedas.indexWhere((element) => element.id == busqueda.id);
    busquedas.removeAt(index);
    notifyListeners();

    return msg;
  }

  //nuevo
  //=======================================================

  void alertCustom(BuildContext context, Busqueda busqueda, String option, ) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Icon(
          Icons.notification_important,
          color: Colors.amber,
          size: 100,
        ),
        content: Text(
          (option == 'guardar') ? '¿Seguro de guardar?' : '¿Seguro de Eliminar?',
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
        if(option == 'guardar') {
          if (busqueda.id == null) {
            guardarDB(context, busqueda),
          } else {
            actualizarDB(context, busqueda),
          }
        } else if (option == 'eliminar') {
          eliminarBusqueda(context, busqueda)
        }
        
        // guardarDB(context, busqueda),
      }
    });
  }
}

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    Key? key,
    required this.msg,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String msg;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        icon,
        color: color,
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
    );
  }
}