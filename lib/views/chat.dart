import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _fireStore = Firestore();
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _fireStore.collection('messages').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return ListView();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      keyboardAppearance: Brightness.dark,
                      decoration: const InputDecoration(
                        hintText: 'Your thoughts here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SendButton(
                    callback: () {},
                    text: 'send',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({Key key, this.callback, this.text}) : super(key: key);

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FlatButton(
          onPressed: callback,
          color: Colors.teal,
          child: Text(text),
        ),
      );
}
