import 'package:dio/dio.dart';

import '../models/transaction_model.dart';

abstract class TransactionsRemoteDataSource {
  Future<List<TransactionModel>> getTransactionsForBlock(String blockHash);
}

class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  final Dio dio;

  TransactionsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TransactionModel>> getTransactionsForBlock(
      String blockHash) async {
    try {
      final response =
          await dio.get('https://blockchain.info/rawblock/$blockHash');
      if (response.statusCode == 200) {
        final transactions = response.data['tx'] as List;
        return transactions
            .map((transaction) => TransactionModel.fromJson(transaction))
            .toList();
      } else {
        throw Exception('Failed to fetch transactions');
      }
    } catch (e) {
      throw Exception('Error fetching transactions: $e');
    }
  }
}
