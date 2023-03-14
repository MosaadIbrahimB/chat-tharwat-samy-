import 'package:flutter/material.dart';

class TextModel extends StatelessWidget {
  String title,fontfamily;
  double fontsize;
  FontWeight fontweight;
  Color color;

  TextModel({this.title='',this.fontsize=28,this.fontweight=FontWeight.normal,this.fontfamily='',this.color=Colors.black87});
  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(fontSize:fontsize,fontWeight:fontweight, fontFamily: fontfamily ,color: color ),);
  }
}
