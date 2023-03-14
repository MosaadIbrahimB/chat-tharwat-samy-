import 'package:flutter/material.dart';

class TextFormfieldModel extends StatelessWidget {
  String hinttext;
  bool obscureText;
  TextFormfieldModel({this.hinttext = '', this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: obscureText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      decoration: InputDecoration(
        labelText: " $hinttext ",

        labelStyle:TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        hintText: "$hinttext",
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),

          ),

      ),
    );
  }
}
