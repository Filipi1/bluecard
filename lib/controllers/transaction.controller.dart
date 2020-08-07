import 'package:creditcard/models/transaction.model.dart';
import 'package:creditcard/repositorys/transaction.repository.dart';
import 'package:dio/dio.dart';

class TransactionController {
  TransactionRepository transactionRepository;

  TransactionController() {
    transactionRepository = new TransactionRepository();
  }

  Future<List<TransactionModel>> ListTransactions(String cpf) async {
    Response resp = await transactionRepository.ListTransactions(cpf);
    Iterable transaction = resp.data;
    List<TransactionModel> transactions = transaction.map((t) => TransactionModel.fromJson(t)).toList();
    return transactions;
  }
}