import 'package:chat/core/api/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class RegisterRemoteDataSource {
  Future<Either<NetWorkError, UserCredential>> register({required String email,required String password});
}

class RegisterFirebaseDataSourceImp implements RegisterRemoteDataSource {

  RegisterFirebaseDataSourceImp();
  @override
  Future<Either<NetWorkError, UserCredential>> register({required String email, required String password}) async {
    try {
      FirebaseAuth auth=FirebaseAuth.instance;

      var user=await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(user);
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case "e.code == 'weak-password'":
          return left(NetWorkError(msg: "The password provided is too weak"));
        case "e.code == 'email-already-in-use'":
          return left(NetWorkError(msg: "The account already exists for that email"));
        default:
          return left(NetWorkError(msg: "Unknown error."));
      }
    }catch (e){
      return left(NetWorkError(msg: "Error Server"));

    }
  }
}
/*
  static creatUser() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email!, password: passwod!);
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
 */