import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 500,
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          child: Icon(Icons.home),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, 'loginPage', (route) => false),
        ),
      ),
    );
  }
}
