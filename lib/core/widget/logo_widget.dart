import 'package:flutter/material.dart';

import 'text_widget.dart';
class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/images/scholar.png',
            height: 100,
          ),
          TextWidget(
            title: 'Scholar chat',
            fontSize: 30,
            fontFamily: 'Pacifico',
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
