import '../../api_service.dart';
import 'dart:async';

class ServicePostagem extends ApiService {
  Future<List<Postagem>> getPostagens() async {
    var parse = await get('postagens');
    var result = (parse['postagens'] as List)
        .map<Postagem>((json) => Postagem.fromJson(json))
        .toList;
    return result;
  }
}