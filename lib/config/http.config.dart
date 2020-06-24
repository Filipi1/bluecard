import 'global.config.dart';

abstract class HttpConfig {
  final String urlBase;

  Map<String, String> basicHeaders;
  Map<String, String> headers;
  String url;

  HttpConfig(this.urlBase) {
    this.url = GlobalConfig.apiUrl + urlBase;
    this.basicHeaders = {"Content-Type":"application/json"};
  }
}

Future<Map<String, String>> getHttpHeaders() async {
  Map<String, String> headers = {"Content-Type":"application/json", "Authorization": "123456"};
  return headers;
}