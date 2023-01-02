import 'dart:convert';

class Busqueda {
  int? id;
  String nombre;
  int? edad;
  String ciudad;
  String ultimaVisto;
  String comunicarseCon;
  String? fotos;
  String? fecha;
  String? vestimenta;
  String? url;

  Busqueda({
    required this.nombre,
    required this.edad,
    required this.ciudad,
    required this.ultimaVisto,
    required this.comunicarseCon,
    this.id,
    this.fotos,
    this.fecha,
    this.vestimenta,
    this.url,
  });

  factory Busqueda.fromJson(String str) => Busqueda.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Busqueda.fromMap(Map<String, dynamic> json) => Busqueda(
    id: json["id"],
    nombre: json["nombre"],
    edad: json["edad"],
    ciudad: json["ciudad"],
    ultimaVisto: json["ultima_visto"],
    comunicarseCon: json["comunicarse_con"],
    fotos: json["fotos"],
    fecha: json["fecha"],
    vestimenta: json["vestimenta"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "nombre": nombre,
    "edad": edad,
    "ciudad": ciudad,
    "ultima_visto": ultimaVisto,
    "comunicarse_con": comunicarseCon,
    "fotos": fotos,
    "fecha": fecha,
    "vestimenta": vestimenta,
    "url": url,
  };

  Busqueda copyWith() => Busqueda(
    nombre: nombre,
    edad: edad,
    ciudad: ciudad,
    ultimaVisto: ultimaVisto,
    comunicarseCon: comunicarseCon,
    fotos: fotos,
    id: id,
    fecha: fecha,
    vestimenta: vestimenta,
    url: url
  );
}
