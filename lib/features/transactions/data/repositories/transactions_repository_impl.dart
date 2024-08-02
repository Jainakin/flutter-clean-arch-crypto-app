import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transactions_repository.dart';
import '../datasources/transactions_remote_data_source.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsRemoteDataSource remoteDataSource;

  TransactionsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsForBlock(
      String blockHash) async {
    try {
      final remoteTransactions =
          await remoteDataSource.getTransactionsForBlock(blockHash);
      return Right(remoteTransactions
          .map((transactionModel) => transactionModel.toEntity())
          .toList());
    } catch (e) {
      return const Left(ServerFailure(
        message: 'An error occurred while fetching transactions',
      ));
    }
  }
}
