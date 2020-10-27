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

  Future<Usuario> PostUsuario(Usuario usuario) async {
    //enviar m Map como segundo parametro
    //esse map contem os dados que vai ser enviado no post
    var parse = await post('usuarios', usuario.toMap());
        log('data: ${parse}');

    return usuario;
  }
}