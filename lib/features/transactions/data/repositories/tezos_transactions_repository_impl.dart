import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/tezos_transaction.dart';
import '../../domain/repositories/tezos_transactions_repository.dart';
import '../datasources/tezos_transactions_remote_data_source.dart';

class TezosTransactionsRepositoryImpl implements TezosTransactionsRepository {
  final TezosTransactionsRemoteDataSource remoteDataSource;

  TezosTransactionsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TezosTransaction>>> getTransactionsForBlock(
      int level) async {
    try {
      final remoteTransactions =
          await remoteDataSource.getTransactionsForBlock(level);
      return Right(remoteTransactions
          .map((transactionModel) => transactionModel.toEntity())
          .toList());
    } catch (e) {
      return Left(ServerFailure(
        message:
            'An error occurred while fetching transactions: ${e.toString()}',
      ));
    }
  }
}
