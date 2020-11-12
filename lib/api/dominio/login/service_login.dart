import 'package:testando/api/dominio/login/loginUsuario.dart';
import 'package:testando/api/dominio/usuario/usuario.dart';

import '../../api_service.dart';
import 'dart:developer';
import 'dart:async';


class ServiceLogin extends ApiService {

  Future<LoginUsuario> postLogin(LoginUsuario loginUsuario) async {
    //enviar m Map como segundo parametro
    //esse map contem os dados que vai ser enviado no post
    var parse = null;
    parse = await post('usuarios/login', loginUsuario.toMap());
//    log('data: ${parse}');
    return parse;
  }
}