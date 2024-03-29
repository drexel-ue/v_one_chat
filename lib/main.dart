import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v_one_flutter_chat/utils.dart';
import 'package:v_one_flutter_chat/views/chat.dart';
import 'package:v_one_flutter_chat/views/landing.dart';
import 'package:v_one_flutter_chat/views/login.dart';
import 'package:v_one_flutter_chat/views/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData.dark(),
      initialRoute: landingRoute,
      routes: {
        landingRoute: (BuildContext context) => Landing(),
        registrationRoute: (BuildContext context) => Registration(),
        loginRoute: (BuildContext context) => Login(),
        chatRoute: (BuildContext context) => Chat(),
      },
    ),
  );
}
