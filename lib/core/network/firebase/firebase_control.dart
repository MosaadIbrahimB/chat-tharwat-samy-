import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'message_model.dart';
import 'user_model.dart';
import '../error/error.dart';

class FireBaseControl {
  static String? _userId;
  static String? _email;

  static getUserId(){
    return _userId;
  }
  static getEmail(){
    return _email;
  }
  ///REGISTER FUNCTION
  static Future<Either<NetWorkError, UserCredential>> register(
      {required FirebaseAuth auth,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _email=email;
      _userId = userCredential.user!.uid;
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

  ///LOGIN FUNCTION
  static Future<Either<NetWorkError, UserCredential>> login(
      {required String email, required String password}) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      var user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      _userId = user.user?.uid;
      _email=email;
      return right(user);
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case "invalid-email":
          return left(NetWorkError(msg: "Not a valid email address."));
        default:
          return left(NetWorkError(msg: "Unknown error.${exception.message}"));
      }
    } catch (e) {
      return left(NetWorkError(msg: "Error Server"));
    }
  }

  /// collection USER from && to
  static CollectionReference _userRef() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  ///COLLECTION MESSAGE
  static CollectionReference _messageRef() {
    return FirebaseFirestore.instance
        .collection('message')
        .withConverter<MessageModel>(
          fromFirestore: (snapshot, _) =>
              MessageModel.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson(),
        );
  }

  /// ADD USER COLLECTION
  static Future<void> addUser(UserModel user) {
    var folderTask = _userRef(); //folder name task
    var fileDoc = folderTask.doc(); //fileName doc
    return fileDoc.set(user); //write all data in file from obj tas;
  }

  /// ADD USER COLLECTION ADD MESSAGE COLLECTION
  static Future<Either<NetWorkError, MessageModel>> addMessage(
      {required MessageModel messageModel}) async {
    try {
      var folderTask = _messageRef(); //folder name task
      var fileDoc = folderTask.doc();
      messageModel.uid=_userId ?? "123";
      messageModel.dateTime=DateTime.now();
      messageModel.email=  getEmail();
      await fileDoc.set(messageModel);
      return right(messageModel);
    } on Exception catch (e) {
      return left(NetWorkError(msg: "Error Server $e"));
    }
  }

  /// Get Message
  static Stream<QuerySnapshot<Map<String, dynamic>>> getMessage() {
    return FirebaseFirestore.instance.collection('message').orderBy('dateTime',descending: true).snapshots();
  }

  static Future<Either<NetWorkError, String>> deleteMessage(int index) async {
    CollectionReference message =
        FirebaseFirestore.instance.collection('message');
    try {
      var value = await message.orderBy('dateTime',descending: true).get();
      await message.doc(value.docs[index].id).delete();
      return right("User Deleted");
    } catch (error) {
      return left(NetWorkError(msg: "Failed to delete user: $error"));
    }
  }
}
