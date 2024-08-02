import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/usecases/get_transactions_for_block.dart';

class TransactionsProvider extends ChangeNotifier {
  final GetTransactionsForBlock getTransactionsForBlock;

  TransactionsProvider({required this.getTransactionsForBlock});

  List<Transaction> _transactions = [];
  bool _isLoading = false;
  Failure? _error;

  List<Transaction> get transactions => _transactions;
  bool get isLoading => _isLoading;
  Failure? get error => _error;

  Future<void> fetchTransactions() async {
    _isLoading = true;
    notifyListeners();

    final result = await _getLatestBlockHash();

    result.fold(
      (failure) {
        _error = failure;
        _isLoading = false;
        notifyListeners();
      },
      (blockHash) async {
        final transactionsResult = await getTransactionsForBlock(blockHash);

        transactionsResult.fold(
          (failure) {
            _error = failure;
            _isLoading = false;
            notifyListeners();
          },
          (transactions) {
            _transactions = transactions;
            _isLoading = false;
            notifyListeners();
          },
        );
      },
    );
  }

  Future<Either<Failure, String>> _getLatestBlockHash() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://blockchain.info/latestblock');
      if (response.statusCode == 200) {
        return Right(response.data['hash']);
      } else {
        return Left(
            ServerFailure(message: response.statusMessage ?? 'Unknown error'));
      }
    } catch (e) {
      return Left(
        ServerFailure(
          message: e is DioException
              ? e.message ?? 'Unknown error'
              : 'Unknown error',
        ),
      );
    }
  }
}
