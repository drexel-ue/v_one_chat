import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/auth_services/firebase_auth_service.dart';
import 'package:v_one_flutter_chat/auth_services/user.dart';

class Chat extends StatefulWidget {
  const Chat({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _auth = FirebaseAuthService();
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Container(
            child: Image.asset('assets/full_logo.png'),
          ),
        ),
        title: const Text('Chat'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.popUntil(context, (Route route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
