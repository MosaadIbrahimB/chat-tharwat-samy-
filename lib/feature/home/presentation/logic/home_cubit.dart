import 'package:bloc/bloc.dart';
import 'package:chat/feature/login/presentation/screen/export.dart';

import '../../domain/use_case/add_message_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AddMessageUseCase addMessageUseCase;

  HomeCubit(this.addMessageUseCase) : super(HomeInitial());
 static HomeCubit  get(context)=>BlocProvider.of(context);

  TextEditingController? controller = TextEditingController();


  addMessage( ) async {
    var res = await addMessageUseCase(msg:controller!.text??"");
    res.fold(
      (error) {
        emit(AddMessageErrorState());
      },
      (message) {
        emit(AddMessageSucceedState());
      },
    );
  }


  changeBtnColor(String value){
    if(value.isEmpty){
      emit(ChangBtnState(false));
          }else{
      emit(ChangBtnState(true));
    }
  }
}
