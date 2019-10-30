import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/auth_services/user.dart';

class Chat extends StatefulWidget {
  const Chat({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
