import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/auth_services/firebase_auth_service.dart';
import 'package:v_one_flutter_chat/auth_services/user.dart';
import 'package:v_one_flutter_chat/views/chat.dart';
import 'package:v_one_flutter_chat/widgets/custom_button.dart';

class Registration extends StatefulWidget {
  Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _email;
  String _password;
  String _name;

  final _auth = FirebaseAuthService();

  Future<void> registerUser() async {
    User _user =
        await _auth.createUserWithEmailAndPassword(_name, _email, _password);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Chat(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                width: 100,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            SizedBox(height: 40),
            TextField(),
            SizedBox(height: 40),
            TextField(),
            SizedBox(height: 40),
            CustomButton(
              text: 'Register',
              callback: () async {
                await registerUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
