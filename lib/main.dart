import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/api/error/firebase_control.dart';
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
        't':(context) => const T(),
      },
      initialRoute: "registerScreen",
    );
  }
}
class T extends StatelessWidget {
  const T({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: ()async{
        try {
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: "mosaadibrah125@gmail.com",
            password: "123456789",
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      }, child:Text( "Test")),),
    );
  }
}

