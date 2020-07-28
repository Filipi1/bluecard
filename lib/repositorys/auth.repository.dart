import 'package:creditcard/config/http.config.dart';
import 'package:creditcard/models/auth.model.dart';
import 'package:dio/dio.dart';

class AuthRepository extends HttpConfig {
  Dio dio = new Dio();
  AuthRepository() : super("/auth");

  Future<Response> signIn(AuthModel authModel) async {
    Response response = await dio.post(url, data: authModel, options: Options(headers: basicHeaders));
    return response;
  }
}