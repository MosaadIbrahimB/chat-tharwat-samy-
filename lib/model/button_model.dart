import 'package:chat/model/text_model.dart';
import 'package:flutter/material.dart';

class BttnModel extends StatelessWidget {
  String text;
  BttnModel({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){print('object');},
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
            style: TextStyle(
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