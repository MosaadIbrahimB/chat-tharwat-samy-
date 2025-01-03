import 'package:chat/core/api/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';



abstract class RegisterRemoteDataSource {
  Future<Either<NetWorkError, UserCredential>> register({required String email,required String password});
}

class RegisterFirebaseDataSourceImp implements RegisterRemoteDataSource {
 final FirebaseAuth auth;

  RegisterFirebaseDataSourceImp({required this.auth});

  @override
  Future<Either<NetWorkError, UserCredential>> register({required String email, required String password}) async {

    try {
      UserCredential userCredential=await auth.createUserWithEmailAndPassword(email: email, password: password);
      return right(userCredential);
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case 'weak-password':
          return left(NetWorkError(msg: "The password provided is too weak"));
        case 'email-already-in-use':
          return left(NetWorkError(msg: "The account already exists for that email"));
        case 'invalid-email':
          return left(NetWorkError(msg: "The email address is invalid"));
        default:
          return left(NetWorkError(msg: "Unknown Firebase error: ${exception.code}"));
      }
    }catch (e){
      print(e.toString());
      return left(NetWorkError(msg: "Error Server${e.toString()}"));

    }
  }
}