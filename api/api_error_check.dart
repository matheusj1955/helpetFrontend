import 'dart:developer';

class ApiErrorCheck {
  int _statusCode;
  String _url;
  String _method;
  Map<String, dynamic> _body;


  ApiErrorCheck(this._statusCode, this._url, this._method, Map<String, dynamic> this._body);

  void printLog() {
    switch (_statusCode) {
      case 200:
        log('API: $_statusCode, OK! Success on [$_method] from api: [$_url]');
        break;
      case 201:
        log('API: $_statusCode, Created/Updated! Success on [$_method] from api: [$_url]');
        break;
//      case 201:
//        log('API: $_statusCode, Accepted, but not completed! Success on [$_method] from api: [$_url]');
//        break;
      case 401:
        log('API: $_statusCode, Without Authorization! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      case 403:
        log('API: $_statusCode, Forbiden! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      case 404:
        log('API: $_statusCode, Not Found! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      case 500:
        log('API: $_statusCode, Internal Server Error! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      case 501:
        log('API: $_statusCode, Not implemented! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      case 502:
        log('API: $_statusCode, Bad Gateway! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      case 503:
        log('API: $_statusCode, Service Unavailable! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      case 504:
        log('API: $_statusCode, Gateway Time-Out! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      case 505:
        log('API: $_statusCode, HTTP Version not supported! Error on [$_method] from api: [$_url] => Message: [$_body]');
        break;
      default:
        log('API: $_statusCode! Response [$_method] from api: [$_url] => Message: [$_body]');
        break;
    }
  }
}
