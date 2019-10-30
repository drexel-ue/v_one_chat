import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const landingRoute = 'LANDING';
const loginRoute = 'LOGIN';
const registrationRoute = 'REGISTRATION';
const chatRoute = 'CHAT';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => Center(
      child: CircularProgressIndicator(),
    ),
  );
}
