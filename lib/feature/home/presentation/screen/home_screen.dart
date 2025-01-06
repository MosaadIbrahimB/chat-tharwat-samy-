import 'package:flutter/material.dart';

import '../../../../core/constrain.dart';
import '../widget/app_bar_widget.dart';
import '../widget/chat_send_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  suffixIcon: IconButton(
                      onPressed: () {},
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
