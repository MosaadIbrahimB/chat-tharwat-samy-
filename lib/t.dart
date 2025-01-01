import 'package:flutter/material.dart';

class CardApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff314e69) ,
      body: Column(children: [
        CircleAvatar(child: Image.asset("assets/images/scholar.png")),
        Text("Thrwat Samy",style:TextStyle(fontSize: 24),),
        Text("Flutter Developer",style:TextStyle(fontSize: 24),),

      ],),
    );
  }
}
