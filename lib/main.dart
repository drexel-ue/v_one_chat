import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/views/chat.dart';
import 'package:v_one_flutter_chat/views/landing.dart';
import 'package:v_one_flutter_chat/views/login.dart';
import 'package:v_one_flutter_chat/views/registration.dart';

void main() => runApp(
      MaterialApp(
        title: 'Chat Demo',
        theme: ThemeData.dark(),
        initialRoute: 'LANDING',
        routes: {
          'LANDING': (BuildContext context) => Landing(),
          'REGISTRATION': (BuildContext context) => Registration(),
          'LOGIN': (BuildContext context) => Login(),
          'CHAT': (BuildContext context) => Chat(),
        },
      ),
    );
