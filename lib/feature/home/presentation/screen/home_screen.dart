import 'package:chat/core/ingect/get_it_control.dart';
import 'package:chat/core/network/firebase/message_model.dart';
import 'package:chat/feature/home/presentation/logic/btn_cubit.dart';
import 'package:chat/feature/home/presentation/logic/home_cubit.dart';
import 'package:chat/feature/home/presentation/widget/app_bar_widget.dart';
import 'package:chat/feature/home/presentation/widget/chat_send_widget.dart';
import 'package:chat/feature/home/presentation/widget/text_form_widget.dart';
import 'package:chat/feature/login/presentation/screen/export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<HomeCubit>()..getMessage(),
          ),
          BlocProvider(
            create: (context) => BtnCubit(),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is AddMessageSucceedState) {
                      List<MessageModel> list = state.listMessage ?? [];
                      return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: ()async{

                            CollectionReference message = FirebaseFirestore.instance.collection('message');
                         await message.get().then((value) {
                            print("${value.docs[index].id}-------------------------");
                            message.doc(value.docs[index].id).delete() .then((value) => print("User Deleted"))
                                .catchError((error) => print("Failed to delete user: $error"));
                          },);

                          },
                          child: ChatSendWidget(
                            title: list[index].textMsg,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              TextFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
