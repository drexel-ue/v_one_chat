import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/utils.dart';
import 'package:v_one_flutter_chat/widgets/custom_button.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  static const String id = 'LANDING';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  width: 200,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              const Text(
                'YourVOne Chat',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 40),
              ),
              SizedBox(height: 50),
              CustomButton(
                text: 'Log In',
                callback: () {
                  Navigator.of(context).pushNamed(loginRoute);
                },
              ),
              CustomButton(
                text: 'Register',
                callback: () {
                  Navigator.of(context).pushNamed(registrationRoute);
                },
              ),
            ],
          ),
        ),
      );
}
