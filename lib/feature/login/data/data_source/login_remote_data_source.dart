import 'package:chat/core/network/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/network/firebase/firebase_control.dart';



abstract class LoginRemoteDataSource {
  Future<Either<NetWorkError, UserCredential>> login({required String email,required String password});
}

class LoginFirebaseDataSourceImp implements LoginRemoteDataSource {

  LoginFirebaseDataSourceImp();
  @override
  Future<Either<NetWorkError, UserCredential>> login({required String email, required String password}) async {

   return await FireBaseControl.login(email: email, password: password);


  }
}