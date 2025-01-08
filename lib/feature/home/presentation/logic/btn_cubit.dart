import 'package:chat/feature/login/presentation/screen/export.dart';

class BtnCubit extends Cubit<bool> {
  BtnCubit() : super(false);

  changeBtnColor(String value) {
    if (value.isEmpty) {
      emit(false);
    } else {
      emit(true);
    }
  }
}
