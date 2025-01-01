import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String title,fontFamily;
  double fontSize;
  FontWeight fontWeight;
  Color color;

  TextWidget({super.key, this.title='',this.fontSize=20,this.fontWeight=FontWeight.normal,this.fontFamily='',this.color=Colors.black87});
  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(fontSize:fontSize,fontWeight:fontWeight, fontFamily: fontFamily ,color: color ),);
  }
}
