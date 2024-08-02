import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, void>> signOut();
}
