import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

class SignInWithEmailAndPassword implements UseCase<User, Params> {
  final AuthenticationRepository repository;

  SignInWithEmailAndPassword(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.signInWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
