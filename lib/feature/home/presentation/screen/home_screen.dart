import 'package:chat/core/ingect/get_it_control.dart';
import 'package:chat/feature/home/presentation/logic/home_cubit.dart';
import 'package:chat/feature/login/presentation/screen/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constrain.dart';
import '../../../../core/network/firebase/firebase_control.dart';
import '../widget/app_bar_widget.dart';
import '../widget/chat_send_widget.dart';
import '../widget/text_form_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: FireBaseControl.getMessage(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<QueryDocumentSnapshot<Map<String, dynamic>>>?
                            list = snapshot.data?.docs ?? [];

                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) => ChatSendWidget(
                            title: list[index]["textMsg"] ?? "",
                          ),
                        );
                      }
                      return const Text("data");
                    },
                  ),
                ),
                const TextFormWidget(),
              ],
            ),
          );
        }),
      ),
    );
  }
}

