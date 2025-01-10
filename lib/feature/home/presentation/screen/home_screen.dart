import 'package:chat/core/ingect/get_it_control.dart';
import 'package:chat/core/network/firebase/firebase_control.dart';
import 'package:chat/core/network/firebase/message_model.dart';
import 'package:chat/feature/home/presentation/logic/btn_cubit.dart';
import 'package:chat/feature/home/presentation/logic/home_cubit.dart';
import 'package:chat/feature/home/presentation/widget/app_bar_widget.dart';
import 'package:chat/feature/home/presentation/widget/chat_friend_widget.dart';
import 'package:chat/feature/home/presentation/widget/chat_send_widget.dart';
import 'package:chat/feature/home/presentation/widget/text_form_widget.dart';
import 'package:chat/feature/login/presentation/screen/export.dart';

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
                        reverse: true,
                        controller: HomeCubit.get(context).controllerScroll,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          bool user =
                              list[index].uid == FireBaseControl.getUserId();
                          return user
                              ? ChatSendWidget(
                                  userEmail: list[index].email ?? "",
                                  title: list[index].textMsg,
                                  onDismissed: () {
                                    onDismissed(user, context, index);
                                  },
                                )
                              : ChatFriendWidget(
                                  userEmail:  list[index].email??"email",
                                  title: list[index].textMsg,
                                );
                        },
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

  onDismissed(bool user, BuildContext context, int index) {
    if (user) {
      HomeCubit.get(context).deleteMessage(index);
    }
  }
}
