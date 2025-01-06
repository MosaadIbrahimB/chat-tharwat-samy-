import 'package:flutter/material.dart';

import '../../../../core/constrain.dart';
class ChatSendWidget extends StatelessWidget {
  const ChatSendWidget({
    super.key,
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
        child: const Text(
          "Hello world",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
