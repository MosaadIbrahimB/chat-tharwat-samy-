import 'package:chat/core/network/error/error.dart';
import 'package:chat/core/network/firebase/firebase_control.dart';
import 'package:chat/core/network/firebase/message_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<NetWorkError,MessageModel>> addMessage(
      {required MessageModel messageModel});


  Future<Either<NetWorkError, String>> deleteMessage(int index) ;

  }

class HomeFirebaseDataSourceImp implements HomeRemoteDataSource  {

  @override
  Future<Either<NetWorkError, MessageModel>> addMessage({required MessageModel messageModel})async {
    return await FireBaseControl.addMessage( messageModel: messageModel);
  }
  @override
  Future<Either<NetWorkError, String>> deleteMessage(int index) async{
    return await FireBaseControl.deleteMessage(index);
  }



}