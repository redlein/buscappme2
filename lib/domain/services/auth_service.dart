import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseKey = 'AIzaSyBtFF1Xn0_SmhyJdiEKxubmNndKX7fJP_s';

  final storage = const FlutterSecureStorage();

  String urlbase = 'https://tfscdnfyqymsvuhirhdi.supabase.co/rest/v1/usuarios';

  String keydb = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmc2NkbmZ5cXltc3Z1aGlyaGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE2MzI4NjEsImV4cCI6MTk4NzIwODg2MX0._Gwnv4hM69kBd_ai_dQ3TmpJ2Xl1rmNQvuoDpD24xIE';


  //
  // REGISTRO DE USUARIO
  Future<dynamic> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signUp',
      {'key': _firebaseKey},
    );

    final response = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeResponse = json.decode(response.body);

    if (decodeResponse.containsKey('idToken')) {
      storage.write(key: 'token', value: decodeResponse['idToken']);
      return decodeResponse;
    } else {
      return decodeResponse;
    }
  }

  Future<dynamic> createUserSupabase(String email, String nombres, String apellidos, String phone) async {
    final url = Uri.parse(urlbase);

    Map<String, String> header = {
      'apikey': keydb,
      'Authorization': "Bearer $keydb",
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    };

    final Map<String, dynamic> usuario = {
      'email': email,
      'nombre': nombres,
      'apellidos': apellidos,
      'telefono': phone
    };

    final response = await http.post(url, body: json.encode(usuario), headers: header);
    if (response.statusCode != 201) {
      return 'No se ha creado correctamente';
    }
    return null;
  }


  //
  // LOGIN DE USUARIO

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signInWithPassword',
      {'key': _firebaseKey},
    );

    final response = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeResponse = json.decode(response.body);

    if (decodeResponse.containsKey('idToken')) {
      storage.write(key: 'token', value: decodeResponse['idToken']);
      return null;
    } else {
      return decodeResponse['error']['message'];
    }
  }

  Future<dynamic> getUsuarioSupabase(String email) async {
    final url = Uri.parse(urlbase + "?email=eq.$email");

    Map<String, String> header = {
      'apikey': keydb,
      'Authorization': "Bearer $keydb",
    };

    final response = await http.get(url, headers: header);
    final List<dynamic> responseMap = json.decode(response.body);

    return responseMap[0];
  }

  //
  // CERRAR SESIÓN
  Future cerrarSesion() async {
    await storage.delete(key: 'token');
    return;
  }

  //
  // VERIFICAR TOKEN
  Future<String> leerToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
