import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:chat/core/network/error/error.dart';

abstract class LoginRepository {

  Future<Either<NetWorkError, UserCredential>> login({required String email, required String password});

}