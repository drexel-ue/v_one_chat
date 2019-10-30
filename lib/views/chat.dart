import 'package:flutter/material.dart';
import 'package:v_one_flutter_chat/auth_services/user.dart';

class Chat extends StatefulWidget {
  const Chat({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
              Navigator.popUntil(context, (Route route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
