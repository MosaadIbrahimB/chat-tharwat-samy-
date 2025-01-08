import 'package:flutter/material.dart';

import '../../../../core/utils/constrain.dart';
class ChatSendWidget extends StatelessWidget {
  final String title;
  const ChatSendWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )),
        child:  Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
