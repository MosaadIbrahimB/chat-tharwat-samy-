import 'package:flutter/material.dart';

import '../../../../core/constrain.dart';
import '../../../../core/network/firebase/firebase_control.dart';
import '../widget/app_bar_widget.dart';
import '../widget/chat_send_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  TextEditingController? controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const ChatSendWidget(),
              ),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        print("object");
                        FireBaseControl.addMessage(uid: "55",msg: controller!.text??"",dateTime: DateTime.now());
                      },
                      icon: const Icon(
                        Icons.send,
                        color: KPrimaryColor,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
