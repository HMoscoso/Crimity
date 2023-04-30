import 'dart:convert';

List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));
String usuarioToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
  Usuario({
    required this.id,
    required this.nombre,
    required this.email,
    required this.telefono,
    required this.password
  });

  int id;
  String nombre;
  String email;
  String telefono;
  String password;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario (
    id: json["id"],
    nombre: json["nombre"],
    email: json["email"],
    telefono: json["telefono"],
    password: json["password"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "email": email,
    "telefono": telefono,
    "email": email
  };
}