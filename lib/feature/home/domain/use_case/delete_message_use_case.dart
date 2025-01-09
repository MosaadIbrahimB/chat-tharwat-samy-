import 'package:chat/core/network/firebase/message_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/error/error.dart';
import '../repository/home_repository.dart';

class DeleteMessageUseCase {
  HomeRepository homeRepository;

  DeleteMessageUseCase(this.homeRepository);

  Future<Either<NetWorkError, String>> call(
      {required int index}) async {
    return await homeRepository.deleteMessage(index);
  }
}
