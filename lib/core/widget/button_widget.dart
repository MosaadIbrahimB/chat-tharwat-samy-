import 'package:chat/core/widget/text_widget.dart';
import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  String text;
 final VoidCallback ?onTap;
  BtnWidget({super.key, this.text = '',  this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff314F6B)),

          ),
        ),
      ),
    );
  }
}


/*Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Center(
        child: TextButton(

          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff314F6B)),
          ),
        ),
      ),
    );*/