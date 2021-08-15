import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FireBaseAuthService({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<User?> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return authResult.user;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  User? currentUser() {
    final User? user = _firebaseAuth.currentUser!;
    return user;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final authResult = await _firebaseAuth.signInWithCredential(credential);
    return authResult.user;
  }

  Stream<User?> get onAuthStateChanged {
    return _firebaseAuth.userChanges();
  }
}
