import 'dart:convert';

class Busqueda {
  int? id;
  String nombre;
  int? edad;
  String ciudad;
  String ultimaVisto;
  String comunicarseCon;
  String? fotos;

  Busqueda({
    required this.nombre,
    required this.edad,
    required this.ciudad,
    required this.ultimaVisto,
    required this.comunicarseCon,
    this.id,
    this.fotos,
  });

  factory Busqueda.fromJson(String str) => Busqueda.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Busqueda.fromMap(Map<String, dynamic> json) => Busqueda(
    nombre: json["nombre"],
    edad: json["edad"],
    ciudad: json["ciudad"],
    ultimaVisto: json["ultima_visto"],
    comunicarseCon: json["comunicarse_con"],
    fotos: json["fotos"],
  );

  Map<String, dynamic> toMap() => {
    "nombre": nombre,
    "edad": edad,
    "ciudad": ciudad,
    "ultima_visto": ultimaVisto,
    "comunicarse_con": comunicarseCon,
    "fotos": fotos,
  };

  Busqueda copyWith() => Busqueda(
    nombre: nombre,
    edad: edad,
    ciudad: ciudad,
    ultimaVisto: ultimaVisto,
    comunicarseCon: comunicarseCon,
    fotos: fotos,
    id: id
  );
}
