import 'package:chat/core/network/error/error.dart';
import 'package:chat/core/network/firebase/firebase_control.dart';
import 'package:chat/core/network/firebase/message_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<NetWorkError,MessageModel>> addMessage(
      { required String msg});
}

class HomeFirebaseDataSourceImp implements HomeRemoteDataSource  {
  @override
  Future<Either<NetWorkError, MessageModel>> addMessage({required String msg}) async{
  return await FireBaseControl.addMessage(msg: msg, dateTime: DateTime.now());
  }

}