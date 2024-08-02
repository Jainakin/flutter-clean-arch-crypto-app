import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/transaction.dart';
import '../repositories/transactions_repository.dart';

class GetTransactionsForBlock {
  final TransactionsRepository repository;

  GetTransactionsForBlock(this.repository);

  Future<Either<Failure, List<Transaction>>> call(String blockHash) async {
    return await repository.getTransactionsForBlock(blockHash);
  }
}
