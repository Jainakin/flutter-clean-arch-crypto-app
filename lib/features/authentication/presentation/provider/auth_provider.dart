import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/signin_with_email_and_password.dart';

class AuthProvider extends ChangeNotifier {
  final SignInWithEmailAndPassword signInWithEmailAndPassword;

  AuthProvider({required this.signInWithEmailAndPassword});

  User? _user;
  User? get user => _user;

  AuthStatus _status = AuthStatus.initial;
  AuthStatus get status => _status;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> signIn({required String email, required String password}) async {
    _status = AuthStatus.loading;
    notifyListeners();

    final failureOrUser = await signInWithEmailAndPassword(
        Params(email: email, password: password));

    failureOrUser.fold(
      (failure) {
        _errorMessage = _mapFailureToMessage(failure);
        _status = AuthStatus.error;
      },
      (user) {
        _user = user;
        _errorMessage = null;
        _status = AuthStatus.authenticated;
      },
    );
    notifyListeners();
  }

  void signOut() {
    _user = null;
    _errorMessage = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server error. Please try again later.';
      case NetworkFailure:
        return 'No internet connection. Please check your network.';
      case AuthenticationFailure:
        return failure.message;
      default:
        return 'An unknown error occurred.';
    }
  }
}

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}
