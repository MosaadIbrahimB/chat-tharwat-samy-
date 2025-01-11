import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const TextFormFieldWidget(
      {super.key,
      this.hintText = '',
      this.obscureText = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (value){
        if(value=="") {
          return "input anything";
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      decoration: InputDecoration(
      errorStyle: const TextStyle(color: Colors.white),
        labelText: " $hintText ",
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      )
      ),

    );
  }
}
