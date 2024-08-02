import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserModel> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRemoteDataSourceImpl({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<UserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationException(message: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        throw AuthenticationException(
            message: "Wrong password provided for that user.");
      } else {
        throw ServerException(message: "Login failed. Please try again later.");
      }
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw ServerException(
          message: "Sign out failed. Please try again later.");
    }
  }
}
