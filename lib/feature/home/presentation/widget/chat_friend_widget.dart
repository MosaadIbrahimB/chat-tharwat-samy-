import 'package:chat/feature/home/presentation/widget/user_email_and_text_msg_widget.dart';
import 'package:flutter/material.dart';

import 'container_widget.dart';


class ChatFriendWidget extends StatelessWidget {
  final String title;
  final String userEmail;

  const ChatFriendWidget({
    super.key,
    required this.title, required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ContainerWidget(
          friend: true,
          child: UserEmailAndTextMsgWidget(userEmail: userEmail,title: title,friend: true,),
        ),
      ),
    );
  }
}

