import 'package:creditcard/config/http.config.dart';
import 'package:dio/dio.dart';

class LogRepository extends HttpConfig {
  Dio dio = new Dio();
  LogRepository() : super("/log");

  Future<Response> obter() async {
    return await dio.get(url + "/obter", options: Options(headers: basicHeaders));
  }
}