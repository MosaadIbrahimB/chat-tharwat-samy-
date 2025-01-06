import 'package:chat/core/network/error/error.dart';
import 'package:chat/feature/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data_source/login_remote_data_source.dart';

class LoginRepositoryImp implements LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImp(this.loginRemoteDataSource);

  @override
  Future<Either<NetWorkError, UserCredential>> login(
      {required String email, required String password}) async {
    return await loginRemoteDataSource.login(email: email, password: password);
  }
}
