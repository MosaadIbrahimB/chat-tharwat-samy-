import 'package:bloc/bloc.dart';
import 'package:chat/core/network/firebase/firebase_control.dart';
import 'package:chat/core/network/firebase/message_model.dart';
import 'package:chat/feature/login/presentation/screen/export.dart';

import '../../domain/use_case/add_message_use_case.dart';
import '../../domain/use_case/delete_message_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AddMessageUseCase addMessageUseCase;
  final DeleteMessageUseCase deleteMessageUseCase;

  HomeCubit(this.addMessageUseCase, this.deleteMessageUseCase) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  TextEditingController? controller = TextEditingController();
  ScrollController? controllerScroll=ScrollController();
  addMessage() async {
    if(controller!.text.isEmpty)return;
    MessageModel messageModel=MessageModel( textMsg: controller!.text);
    var res = await addMessageUseCase(messageModel:messageModel );
    res.fold(
      (error) {
        emit(AddMessageErrorState());
      },
      (message) {
        FireBaseControl.getMessage().listen(
              (event) {
            List<MessageModel> list =
            event.docs.map((e) => MessageModel.fromJson(e)).toList();

            emit(AddMessageSucceedState(listMessage: list));
          },
        );
      },
    );
  }


  deleteMessage(int index) async {

    var res = await deleteMessageUseCase(index: index);
    res.fold(
          (error) {
        // emit(DeleteMessageErrorState(error.msg??""));
      },
          (message) {
        FireBaseControl.getMessage().listen(
              (event) {
            List<MessageModel> list =
            event.docs.map((e) => MessageModel.fromJson(e)).toList();
            // emit(DeleteMessageSucceedState(message));
          },
        );
      },
    );
  }



  getMessage() {
    FireBaseControl.getMessage().listen(
      (event) {
        List<MessageModel> list =
            event.docs.map((e) => MessageModel.fromJson(e)).toList();
        emit(AddMessageSucceedState(listMessage: list));
      },
    );
  }

  void scrollToEnd() {
    controllerScroll?.animateTo(
      // controllerScroll!.position.maxScrollExtent,
      0,
      duration: const Duration(milliseconds:500),
      curve: Curves.easeIn,
    );
  }
}
