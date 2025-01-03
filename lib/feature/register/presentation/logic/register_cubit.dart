import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/register_remote_data_source.dart';
import '../../data/repository/register_repository_imp.dart';
import '../../domain/repository/register_repository.dart';
import '../../domain/use_case/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  late RegisterRemoteDataSource registerRemoteDataSource;
  late RegisterRepository registerRepository;
  late RegisterUseCase registerUseCase;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RegisterCubit() : super(RegisterInitial()) {
    registerRemoteDataSource = RegisterFirebaseDataSourceImp(auth: FirebaseAuth.instance);
    registerRepository = RegisterRepositoryImp(registerRemoteDataSource);
    registerUseCase = RegisterUseCase(registerRepository);
  }

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  register() async {
    emit(RegisterLoading());
    var response = await registerUseCase.call(email: "abxzzas@gmail.com", password: "123456");

    response.fold(
      (error) {
        emit(RegisterError(msg: error.msg));
      },
      (userCredential) {
        emit(RegisterSucceed(userCredential: userCredential));
      },
    );
  }
}
