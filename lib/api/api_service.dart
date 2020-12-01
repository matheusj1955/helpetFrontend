import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

import 'package:path/path.dart';
import 'package:async/async.dart';

import 'api_error_check.dart';

class ApiService {

  static const _apiPath = "http://192.168.100.35:3000/"; //192.168.100.5 192.168.100.30 10.86.100.62:3000

  dynamic get(String url, [String token = "no_token"]) async {
    var header;
    var response;
    if(token != "no_token"){
      header = {"Authorization": "Bearer $token"};
      response = await http.get(_apiPath + url, headers: header);
    } else {
      response = await http.get(_apiPath + url);
    }
    ApiErrorCheck(response.statusCode, url, 'GET', json.decode(response.body)).printLog();
    return json.decode(response.body);
  }

  dynamic post(String url, Map body, [String token = "no_token"]) async{
    var _headers = {"Content-Type": "application/json"};
    var _body = json.encode(body);
    if(token != "no_token"){
      _headers = {"Content-Type": "application/json", "Authorization": "Bearer $token"};
    } else {
    }
    var response = await http.post(_apiPath + url, headers: _headers, body: _body);
    ApiErrorCheck(response.statusCode, url, 'POST', json.decode(response.body)).printLog();
    return json.decode(response.body);
  }


  dynamic postFile(String url, String titulo, String descricao, File avatar, [String token = "no_token"]) async {
    var header = {"Authorization": "Bearer $token"};
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(avatar.openRead()));
    // get file length
    var length = await avatar.length();
    // string to uri
    var uri = Uri.parse(_apiPath + url);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll(header);

    // multipart that takes file
    String mimeType = mime(basename(avatar.path));
    var multipartFile = new http.MultipartFile('postagem_imagem', stream, length,
      filename: basename(avatar.path) , contentType: MediaType(mimeType.split('/')[0],mimeType.split('/')[1]));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields["titulo"] = titulo;
    request.fields["descricao"] = descricao;

    // send
    var response = await request.send();

    ApiErrorCheck(response.statusCode, url, 'POST', null).printLog();
    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      return value;
    });
    return null;
  }

}