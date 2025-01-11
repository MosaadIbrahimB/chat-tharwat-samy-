import 'package:bloc/bloc.dart';
import 'package:chat/feature/login/domain/use_case/login_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
   LoginUseCase loginUseCase;
   LoginCubit(this.loginUseCase) : super(LoginInitial());

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  var key=GlobalKey<FormState>();


 static LoginCubit get(BuildContext context)=>BlocProvider.of(context);

  login()async{
    if(!key.currentState!.validate())return;
    emit(LoginLoading());
    var response=await  loginUseCase.call(email:email.text ,password:password.text );
    response.fold((error) {
      emit(LoginError(msg: error.msg));
    },(userCredential) {
      emit(LoginSucceed(userCredential: userCredential));
    },);
  }



}
