import 'package:flutter_robinshorts/data/apis/firebase_auth_api.dart';
import 'package:flutter_robinshorts/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'base_authentication_repository.dart';

class FirebaseAuthenticationRepository implements BaseAuthenticationRepository {
  FirebaseAuthApi authApi = FirebaseAuthApi();
  @override
  Stream<UserModel> getCurrentUser() {
    return authApi.retrieveCurrentUser();
  }

  @override
  Future<UserModel?> signIn() {
    try {
      return authApi.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return authApi.signOut();
  }
}
