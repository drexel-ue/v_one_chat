import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/auth_services/firebase_auth_service.dart';
import 'package:v_one_flutter_chat/auth_services/user.dart';
import 'package:v_one_flutter_chat/views/chat.dart';
import 'package:v_one_flutter_chat/widgets/custom_button.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _email;
  String _password;
  String _name;

  final _auth = FirebaseAuthService();

  Future<void> _registerUser() async {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    width: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (String value) => _name = value,
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  hintText: 'Enter Name Please',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (String value) => _email = value,
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  hintText: 'Enter Email Please',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (String value) => _password = value,
                autocorrect: false,
                obscureText: true,
                keyboardAppearance: Brightness.dark,
                decoration: const InputDecoration(
                  hintText: 'Enter Password Please',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Register',
                callback: () async {
                  await _registerUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
