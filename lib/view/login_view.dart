import 'package:chat/model/button_model.dart';
import 'package:chat/model/text_model.dart';
import 'package:flutter/material.dart';
import '../constans.dart';
import '../model/textfild_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/images/scholar.png',
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextModel(
                title: 'Scholar chat',
                fontsize: 30,
                fontfamily: 'Pacifico',
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),

          //login
          Row(
            children: [
              TextModel(
                  title: 'Login',
                  fontweight: FontWeight.bold,
                  fontfamily: '',
                  color: Colors.white),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TextFormfieldModel(hinttext: 'Email'),
          SizedBox(
            height: 15,
          ),
          TextFormfieldModel(hinttext: 'Password', obscureText: true),
          SizedBox(
            height: 15,
          ),
          BttnModel(
            text: 'Login',
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextModel(
                  title: 'don\'t have an account',
                  color: Colors.white,
                  fontsize: 20),
              InkWell(
                  onTap: () {Navigator.pushNamed(context,'registerPage');
                  },
                  child: TextModel(
                    title: ' Register',
                    color: Colors.yellow,
                    fontsize: 20,
                    fontweight: FontWeight.bold,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
//#C7EDE6
