import 'package:testando/api/dominio/usuario/usuario.dart';

import '../../api_service.dart';
import 'dart:async';
import 'dart:developer';


class ServiceUsuario extends ApiService {
  Future<List<Usuario>> getUsuarios() async {
    var parse = await get('usuarios');

    var resultGet = (parse['usuarios'] as List)
        .map<Usuario>((json) => Usuario.fromJson(json))
        .toList();
//    log('data: ${parse}');
    return resultGet;
  }

  Future<Usuario> PostUsuario(String nome, String tel, String email) async {
    var parse = await post("http://192.168.100.35:3000/usuarios", {
      "nome": nome,
      "tel": tel,
      "email": email
    });
  }
}