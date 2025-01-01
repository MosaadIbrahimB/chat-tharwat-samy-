

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/api/error/error.dart';
import '../../domain/repository/register_repository.dart';
import '../data_source/register_remote_data_source.dart';

class LoginRepositoryImp implements RegisterRepository {
  RegisterRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImp(this.loginRemoteDataSource);

  @override
  Future<Either<NetWorkError, UserCredential>> register(
      {required String email, required String password}) async {
    return await loginRemoteDataSource.register(email: email, password: password);
  }
}
