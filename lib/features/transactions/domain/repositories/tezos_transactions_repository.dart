import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/tezos_transaction.dart';

abstract class TezosTransactionsRepository {
  Future<Either<Failure, List<TezosTransaction>>> getTransactionsForBlock(
      int level);
}
