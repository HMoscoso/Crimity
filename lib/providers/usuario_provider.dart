import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/usuario.dart';
import 'package:http/http.dart' as http;

final urlapi = url;
class usuario_provider with ChangeNotifier {
  List<Usuario> usuarios = [];

  usuario_provider() {
    getUsuarios();
  }

  getUsuarios() async {
    final url = Uri.http(urlapi, 'api/usuarios/login');
    final resp = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    final response = usuarioFromJson(resp.body);
    usuarios = response;
    notifyListeners();
  }
}