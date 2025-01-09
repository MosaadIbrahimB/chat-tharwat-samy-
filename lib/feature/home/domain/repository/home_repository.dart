import 'package:chat/core/network/error/error.dart';
import 'package:chat/core/network/firebase/message_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {

  Future<Either<NetWorkError,MessageModel>> addMessage(
      { required String msg});

  Future<Either<NetWorkError, String>> deleteMessage(int index) ;

}