import 'package:chat/core/network/firebase/message_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/error/error.dart';
import '../repository/home_repository.dart';

class AddMessageUseCase {
  HomeRepository homeRepository;

  AddMessageUseCase(this.homeRepository);

  Future<Either<NetWorkError, MessageModel>> call(
      {required MessageModel messageModel}) async {
    return homeRepository.addMessage(messageModel: messageModel);
  }
}
