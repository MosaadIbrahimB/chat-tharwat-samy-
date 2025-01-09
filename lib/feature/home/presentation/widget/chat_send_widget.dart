import 'package:flutter/material.dart';

import '../../../../core/utils/constrain.dart';
class ChatSendWidget extends StatelessWidget {
  final String title;
 final VoidCallback onDismissed;
  const ChatSendWidget({
    super.key, required this.title, required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Dismissible(
        background: Container(
          decoration: BoxDecoration(
          color: Colors.red,
            borderRadius: BorderRadius.circular(8)
          ),
          child:const  Center(child:  Text("Delete",style: TextStyle(color: Colors.white),)),
        ),
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) {
          onDismissed();
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
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
        ),
      ),
    );
  }
}
