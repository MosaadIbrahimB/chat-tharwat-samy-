import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/api/error/error.dart';
import '../repository/register_repository.dart';

class RegisterUseCase{
  RegisterRepository registerRepository;

  RegisterUseCase(this.registerRepository);
  Future<Either<NetWorkError, UserCredential>> call({required String email, required String password})async{
   return await registerRepository.register(email:email ,password: password);
  }

}