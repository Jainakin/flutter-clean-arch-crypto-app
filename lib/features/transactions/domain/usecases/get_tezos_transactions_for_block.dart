import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/tezos_transaction.dart';
import '../repositories/tezos_transactions_repository.dart';

class GetTezosTransactionsForBlock {
  final TezosTransactionsRepository repository;

  GetTezosTransactionsForBlock(this.repository);

  Future<Either<Failure, List<TezosTransaction>>> call(int level) async {
    return await repository.getTransactionsForBlock(level);
  }
}
