import 'package:testando/api/dominio/postagens/postagem.dart';

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

  Future<Postagem> PostPostagem(Postagem postagem) async {
    //enviar m Map como segundo parametro
    //esse map contem os dados que vai ser enviado no post
    var parse = await post('postagens', postagem.toMap());
    log('data: ${parse}');

    return postagem;
  }

}