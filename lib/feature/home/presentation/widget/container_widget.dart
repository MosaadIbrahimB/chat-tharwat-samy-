import 'package:chat/core/utils/constrain.dart';
import 'package:flutter/material.dart';
class ContainerWidget extends StatelessWidget {
  ContainerWidget({super.key,this.child, this.friend=false});
  Widget? child;
  bool? friend;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration:  BoxDecoration(
          color:friend==true? const Color(0xff016f96):KPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: friend==true?const Radius.circular(0):const Radius.circular(16),
            bottomRight: friend==true?const Radius.circular(16):const Radius.circular(0),
          )),
      child: child,
    );
  }
}
