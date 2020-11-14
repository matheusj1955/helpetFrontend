import 'package:shared_preferences/shared_preferences.dart';
import 'package:testando/api/dominio/login/loginUsuario.dart';
import 'package:testando/api/dominio/usuario/usuario.dart';

import '../../api_service.dart';
import 'dart:developer';
import 'dart:async';


class ServiceLogin extends ApiService {

  Future<bool> postLogin(LoginUsuario loginUsuario) async {
    //enviar m Map como segundo parametro
    //esse map contem os dados que vai ser enviado no post
    var parse = null;
    parse = await post('usuarios/login', loginUsuario.toMap());
    var token = loginUsuario.getToken(parse);
    if(token != null){
      gravarToken(token);
      return true;
    }
    else {
      return false;
    }
  }

  gravarToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("chaveToken", token);
  }

  Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString("chaveToken");
  }
}