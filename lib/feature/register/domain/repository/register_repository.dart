import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/api/error/error.dart';

abstract class RegisterRepository {

  Future<Either<NetWorkError, UserCredential>> register({required String email, required String password});

}