import 'package:flutter/widgets.dart';
import 'package:v_one_flutter_chat/auth_services/user.dart';

abstract class Auth {
  Future<User> signInWithEmailAndPassword(
      String email, String password, BuildContext context);

  Future<User> createUserWithEmailAndPassword(
      String name, String email, String password, BuildContext context);

  Stream<User> get onAuthStateChange;

  Future<void> signOut();
}
