import 'package:chat/core/network/error/error.dart';
import 'package:chat/core/network/firebase/message_model.dart';
import 'package:chat/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:chat/feature/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImp implements HomeRepository  {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImp(this.homeRemoteDataSource);

  @override
  Future<Either<NetWorkError, MessageModel>> addMessage({required String msg}) async{
   return await homeRemoteDataSource.addMessage(msg: msg,);
  }

  @override
  Future<Either<NetWorkError, String>> deleteMessage(int index) async{
    return await homeRemoteDataSource.deleteMessage(index);
  }
}