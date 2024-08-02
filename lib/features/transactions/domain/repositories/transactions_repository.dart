import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/transaction.dart';

abstract class TransactionsRepository {
  Future<Either<Failure, List<Transaction>>> getTransactionsForBlock(
      String blockHash);
}
