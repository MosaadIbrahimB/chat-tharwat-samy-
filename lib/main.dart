import 'package:chat/view/login_view.dart';
import 'package:chat/view/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'loginPage':(context) => LoginView(),
        'registerPage':(context) => RegisterView(),

      },
      initialRoute: 'loginPage',
    );
  }
}
