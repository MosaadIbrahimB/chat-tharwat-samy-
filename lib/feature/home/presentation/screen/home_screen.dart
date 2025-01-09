import 'package:chat/core/ingect/get_it_control.dart';
import 'package:chat/core/network/firebase/message_model.dart';
import 'package:chat/feature/home/presentation/logic/btn_cubit.dart';
import 'package:chat/feature/home/presentation/logic/home_cubit.dart';
import 'package:chat/feature/home/presentation/widget/app_bar_widget.dart';
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
                        itemCount: list.length,
                        itemBuilder: (context, index) => ChatSendWidget(
                          title: list[index].textMsg,
                          onDismissed: (){
                            HomeCubit.get(context).deleteMessage(index);
                          },
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
