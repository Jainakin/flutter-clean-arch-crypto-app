import 'package:dio/dio.dart';

import '../models/tezos_transaction_model.dart';

abstract class TezosTransactionsRemoteDataSource {
  Future<List<TezosTransactionModel>> getTransactionsForBlock(int level);
}

class TezosTransactionsRemoteDataSourceImpl
    implements TezosTransactionsRemoteDataSource {
  final Dio dio;

  TezosTransactionsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TezosTransactionModel>> getTransactionsForBlock(int level) async {
    try {
      final response = await dio.get(
          'https://api.tzkt.io/v1/operations/transactions?level=${level - 1}');
      if (response.statusCode == 200) {
        final transactions = response.data as List;
        return transactions
            .map((transaction) => TezosTransactionModel.fromJson(transaction))
            .toList();
      } else {
        throw Exception('Failed to fetch transactions');
      }
    } catch (e) {
      throw Exception('Error fetching transactions: $e');
    }
  }
}
