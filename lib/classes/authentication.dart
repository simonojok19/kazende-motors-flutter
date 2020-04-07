import 'package:firebase_auth/firebase_auth.dart';
import 'package:kazendemotors/classes/authentication_api.dart';

class AuthenticationService implements AuthenticationApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> currentUserUid() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  @override
  FirebaseAuth getFirebaseAuth() {
    print('authentication.dart: getFirebaseAuth() being called');
    return _firebaseAuth;
  }

  @override
  Future<bool> isEmailVerified() {
    // TODO: implement isEmailVerified
    return null;
  }

  @override
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    return null;
  }

  @override
  Future<String> signInWithEmailAndPassword(
      {String email, String password}) async {
    print('authentication.dart: signInWithEmailAndPassword');
    AuthResult _authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _authResult.user.uid;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
