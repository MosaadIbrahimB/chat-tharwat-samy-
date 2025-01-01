import 'package:bloc/bloc.dart';
import 'package:chat/feature/login/data/repository/login_repository_imp.dart';
import 'package:chat/feature/login/domain/repository/login_repository.dart';
import 'package:chat/feature/login/domain/use_case/login_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login/data/data_source/login_remote_data_source.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {


 late LoginRemoteDataSource loginRemoteDataSource;
  late  LoginRepository loginRepository;
  late LoginUseCase loginUseCase;


  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  LoginCubit() : super(LoginInitial()){
    loginRemoteDataSource= LoginFirebaseDataSourceImp();
    loginRepository=LoginRepositoryImp(loginRemoteDataSource);
    loginUseCase=LoginUseCase(loginRepository);
  }


 static LoginCubit get(BuildContext context)=>BlocProvider.of(context);
  login()async{
    emit(LoginLoading());
    var response=await  loginUseCase.call(email:email.text ,password:password.text );
    response.fold((error) {
      emit(LoginError(msg: error.msg));
    },(userCredential) {
      emit(LoginSucceed(userCredential: userCredential));
    },);
  }



}
