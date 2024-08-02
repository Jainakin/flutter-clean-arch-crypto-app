import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/tezos_transaction.dart';
import '../../domain/usecases/get_tezos_transactions_for_block.dart';

class TezosTransactionsProvider extends ChangeNotifier {
  final GetTezosTransactionsForBlock getTransactionsForBlock;

  TezosTransactionsProvider({required this.getTransactionsForBlock});

  List<TezosTransaction> _transactions = [];
  bool _isLoading = false;
  Failure? _error;

  List<TezosTransaction> get transactions => _transactions;
  bool get isLoading => _isLoading;
  Failure? get error => _error;

  int blockReward = 0;
  int blockBonus = 0;
  int blockFees = 0;

  Future<void> fetchTransactions() async {
    _isLoading = true;
    notifyListeners();

    final result = await _getLatestBlockLevel();

    result.fold(
      (failure) {
        _error = failure;
        _isLoading = false;
        notifyListeners();
      },
      (level) async {
        final transactionsResult = await getTransactionsForBlock(level);

        transactionsResult.fold(
          (failure) {
            _error = failure as Failure?;
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

  Future<Either<Failure, int>> _getLatestBlockLevel() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://api.tzkt.io/v1/blocks/count');

      _fetchBlockDetails((response.data as int) - 1);
      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return const Left(ServerFailure(
          message: 'Failed to fetch latest block level',
        ));
      }
    } catch (e) {
      return Left(ServerFailure(
        message: 'Failed to fetch latest block level: ${e.toString()}',
      ));
    }
  }

  Future<void> _fetchBlockDetails(int level) async {
    try {
      final dio = Dio();
      final response = await dio.get('https://api.tzkt.io/v1/blocks/$level');

      if (response.statusCode == 200) {
        final block = response.data;
        blockReward = block['rewardLiquid'] as int;
        blockBonus = block['bonusLiquid'] as int;
        blockFees = block['fees'] as int;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error fetching block details: $e');
    }
  }
}
