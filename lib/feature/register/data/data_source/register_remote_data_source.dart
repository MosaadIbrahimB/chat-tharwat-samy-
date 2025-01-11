import 'package:chat/core/network/error/error.dart';
import 'package:chat/core/network/firebase/firebase_control.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';



abstract class RegisterRemoteDataSource {
  Future<Either<NetWorkError, UserCredential>> register({required String email,required String password});
}

class RegisterFirebaseDataSourceImp implements RegisterRemoteDataSource {

  RegisterFirebaseDataSourceImp();

  @override
  Future<Either<NetWorkError, UserCredential>> register({required String email, required String password}) async {

 return await   FireBaseControl.register( email: email, password: password);

  }
}