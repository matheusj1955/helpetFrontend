import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:testando/api/dominio/login/service_login.dart';
import 'package:testando/api/dominio/postagens/postagem.dart';
import 'package:testando/login.dart';

import '../../api_service.dart';
import 'dart:async';
import 'dart:developer';


class ServicePostagem extends ApiService {
  Future<List<Postagem>> getPostagens() async {
    var parse = await get('postagens');

    var resultGet = (parse['postagens'] as List)
        .map<Postagem>((json) => Postagem.fromJson(json))
        .toList();
//    log('data: ${parse}');
    return resultGet;
  }

  Future<Postagem> getUmaPostagem(id_post) async {
    var parse = await get('postagens');

    var resultGet = (parse['postagens/id_post'])
        .map<Postagem>((json) => Postagem.fromJson(json))
        .toList();
    return resultGet;
  }



  Future<Postagem> PostPostagem(Postagem postagem) async {
    //enviar m Map como segundo parametro
    //esse map contem os dados que vai ser enviado no post
    var token = await ServiceLogin.getToken();
    log('coisa: ${postagem.imagem}');
    var parse = await postFile('postagens', postagem.titulo,postagem.descricao, postagem.imagem,token);
//    log('data: ${parse}');
    return postagem;
  }

}