import 'package:chat/feature/home/presentation/widget/user_email_and_text_msg_widget.dart';
import 'package:flutter/material.dart';

import 'container_widget.dart';

class ChatSendWidget extends StatelessWidget {
  final String userEmail;
  final String title;
  final VoidCallback onDismissed;
  final bool? friend;

  const ChatSendWidget({
    super.key,
    required this.title,
    required this.onDismissed,
    required this.userEmail,
    this.friend,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Dismissible(
        background: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: Text(
            "Delete",
            style: TextStyle(color: Colors.white),
          )),
        ),
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) {
          onDismissed();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4, bottom: 4),
          child: ContainerWidget(
            child:
                UserEmailAndTextMsgWidget(userEmail: userEmail, title: title),
          ),
        ),
      ),
    );
  }
}
