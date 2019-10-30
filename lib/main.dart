import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/widgets/custom_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Chat Demo',
        theme: ThemeData.dark(),
        home: MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

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
