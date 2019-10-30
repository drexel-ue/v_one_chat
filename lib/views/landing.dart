import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/widgets/custom_button.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

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
                  width: 100,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              Text(
                'YourVOne Chat',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 50),
              CustomButton(
                text: 'Log In',
                callback: () {},
              ),
              CustomButton(
                text: 'Register',
                callback: () {},
              ),
            ],
          ),
        ),
      );
}
