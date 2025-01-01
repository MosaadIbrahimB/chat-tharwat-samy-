import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/api/error/error.dart';

abstract class LoginRepository {

  Future<Either<NetWorkError, UserCredential>> login({required String email, required String password});

}