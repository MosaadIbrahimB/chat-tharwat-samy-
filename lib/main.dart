import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'feature/login/presentation/screen/login_screen.dart';
import 'feature/register/presentation/screen/register_screen.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'loginScreen':(context) => const LoginScreen(),
        'registerScreen':(context) => const RegisterScreen(),
      },
      initialRoute: "loginScreen",
    );
  }
}
