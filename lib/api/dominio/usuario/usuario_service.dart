
import 'package:testando/api/dominio/usuario/usuario.dart';

import '../../api_service.dart';
import 'dart:async';
import 'dart:developer';


class ServiceUsuario extends ApiService {
  Future<List<Usuario>> getUsuarios() async {
    var parse = await get('usuarios');

    var result = (parse['usuarios'] as List)
        .map<Usuario>((json) => Usuario.fromJson(json))
        .toList();
//    log('data: ${parse}');
    return result;
  }
}