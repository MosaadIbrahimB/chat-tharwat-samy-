import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/user_model.dart';
import 'error.dart';

class FireBaseControl {
  static Future<Either<NetWorkError, UserCredential>> register(
      {required FirebaseAuth auth,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel =
          UserModel(name: email, uid: userCredential.user!.uid);
      addUser(userModel);
      return right(userCredential);
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case 'weak-password':
          return left(NetWorkError(msg: "The password provided is too weak"));
        case 'email-already-in-use':
          return left(
              NetWorkError(msg: "The account already exists for that email"));
        case 'invalid-email':
          return left(NetWorkError(msg: "The email address is invalid"));
        default:
          return left(
              NetWorkError(msg: "Unknown Firebase error: ${exception.code}"));
      }
    } catch (e) {
      return left(NetWorkError(msg: "Error Server${e.toString()}"));
    }
  }

// collection  from && to
  static CollectionReference _userRef() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static Future<void> addUser(UserModel user) {
    var folderTask = _userRef(); //folder name task
    var fileDoc = folderTask.doc(); //fileName doc
    user.uid = fileDoc.id; //number file
    return fileDoc.set(user); //write all data in file from obj tas;
  }
}
