import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v_one_flutter_chat/auth_services/auth.dart';
import 'package:v_one_flutter_chat/auth_services/user.dart';

class FirebaseAuthService extends Auth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (result.user != null) {
      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      await result.user.updateProfile(info);

      return _userFromFirebaseUser(result.user);
    } else {
      return null;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebaseUser(result.user);
  }

  Future<void> verifyPhoneNumber({
    @required String phoneNumber,
    @required
        Function(String verificationId, [int forceResendingToken]) onCodeSent,
    @required Function(AuthException authException) onVerificationFailed,
    @required Function(AuthCredential credential) onVerificationCompleted,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: onVerificationCompleted,
        verificationFailed:
            onVerificationFailed, //(AuthException authException) {},
        codeSent:
            onCodeSent, //(String verificationId, [int forceResendingToken]) {}
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<User> signInUsingPhoneCredentials(AuthCredential credential) async {
    AuthResult result = await _firebaseAuth.signInWithCredential(credential);
    if (result != null) {
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    return null;
  }

  Future<User> signInWithPhoneNumber(
      {@required verificationId, String smsCode}) async {
    FirebaseUser user;
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final AuthResult result =
          await _firebaseAuth.signInWithCredential(credential);
      user = result.user;
    } on PlatformException catch (e) {
      rethrow;
    }
    return _userFromFirebaseUser(user);
  }

  @override
  Future<void> signOut() async => await _firebaseAuth.signOut();

  @override
  // TODO: implement onAuthStateChange
  Stream<User> get onAuthStateChange => _firebaseAuth.onAuthStateChanged
      .map((FirebaseUser user) => _userFromFirebaseUser(user));

  _userFromFirebaseUser(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid, name: user.displayName, emailId: user.email);
  }
}
