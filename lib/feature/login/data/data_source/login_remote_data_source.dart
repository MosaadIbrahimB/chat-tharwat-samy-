import 'package:chat/core/api/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class LoginRemoteDataSource {
  Future<Either<NetWorkError, UserCredential>> login({required String email,required String password});
}

class LoginFirebaseDataSourceImp implements LoginRemoteDataSource {

  LoginFirebaseDataSourceImp();
  @override
  Future<Either<NetWorkError, UserCredential>> login({required String email, required String password}) async {
    try {
      FirebaseAuth auth=FirebaseAuth.instance;

      var user=await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("-*-*-* ${user.user?.uid}");
      return right(user);
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case "invalid-email":
          print("invalid-email");
          return left(NetWorkError(msg: "Not a valid email address."));
        default:
          print("${exception.code}");

          return left(NetWorkError(msg: "Unknown error."));
      }
    }catch (e){
      print(e.toString());
      return left(NetWorkError(msg: "Error Server"));

    }
  }
}