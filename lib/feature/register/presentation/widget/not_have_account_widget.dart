import 'package:chat/feature/login/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';

class NotHaveAccountWidget extends StatelessWidget {
  const NotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
            title: 'Don\'t have an account', color: Colors.white, fontSize: 18),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'registerPage');
            },
            child: TextWidget(
              title: ' Register',
              color: Colors.yellow,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}