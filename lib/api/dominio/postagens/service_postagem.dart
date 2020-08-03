import 'package:testando/api/dominio/postagens/postagem.dart';

import '../../api_service.dart';
import 'dart:async';
import 'dart:developer';


class ServicePostagem extends ApiService {
  Future<List<Postagem>> getPostagens() async {
    var parse = await get('postagens');

    var result = (parse['postagens'] as List)
        .map<Postagem>((json) => Postagem.fromJson(json))
        .toList();
//    log('data: ${parse}');
    return result;
  }
}