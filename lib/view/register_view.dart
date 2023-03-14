import 'package:flutter/material.dart';

import '../constans.dart';
import '../model/button_model.dart';
import '../model/text_model.dart';
import '../model/textfild_model.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(
              height: 15,
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
              height: 40,
            ),

            //login
            Row(
              children: [
                TextModel(
                    title: 'Register',
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

            TextFormfieldModel(hinttext: 'Re-Write Password', obscureText: true),
            SizedBox(
              height: 15,
            ),
            BttnModel(
              text: 'Register',
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextModel(
                    title: 'You have an account',
                    color: Colors.white,
                    fontsize: 20),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: TextModel(
                      title: ' Login',
                      color: Colors.yellow,
                      fontsize: 20,
                      fontweight: FontWeight.bold,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
