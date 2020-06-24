import 'package:creditcard/models/transaction.model.dart';
import 'package:creditcard/repositorys/log.repository.dart';
import 'package:dio/dio.dart';

class LogController {
  LogRepository logRepository;

  LogController() {
    logRepository = new LogRepository();
  }

  Future<List<TransactionModel>> obter() async {
    Response resp = await logRepository.obter();

    Iterable transaction = resp.data;
    List<TransactionModel> transactions = transaction.map((t) => TransactionModel.fromJson(t)).toList();
    return transactions;
  }
}