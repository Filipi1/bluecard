import 'package:creditcard/config/http.config.dart';
import 'package:dio/dio.dart';

class TransactionRepository extends HttpConfig {
  Dio dio = new Dio();
  TransactionRepository() : super("/transaction");

  Future<Response> ListTransactions(String cpf) async {
    return await dio.get(url + "/${cpf}", options: Options(headers: basicHeaders));
  }
}