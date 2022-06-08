import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../models/models.dart';

class FirebaseAuthApi {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<UserModel> retrieveCurrentUser() {
    return auth.authStateChanges().map((User? user) {
      if (user != null) {
        return UserModel(uid: user.uid);
      } else {
        return const UserModel(uid: "uid");
      }
    });
  }

  Future<UserModel?> signInAnonymously() async {
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      log('user credential : $userCredential');
      final userModel =
          const UserModel().copyWith(uid: userCredential.user?.uid);
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<void> signOut() async {
    return await auth.signOut();
  }
}
