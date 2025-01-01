import 'package:chat/feature/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/api/error/error.dart';

class LoginUseCase{
  LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);
  Future<Either<NetWorkError, UserCredential>> call({required String email, required String password})async{
   return await loginRepository.login(email:email ,password: password);
  }

}