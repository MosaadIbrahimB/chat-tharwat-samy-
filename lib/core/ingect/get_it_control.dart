import 'package:chat/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:chat/feature/home/data/repository/home_repository_imp.dart';
import 'package:chat/feature/home/domain/repository/home_repository.dart';
import 'package:chat/feature/home/domain/use_case/add_message_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../feature/home/domain/use_case/delete_message_use_case.dart';
import '../../feature/home/presentation/logic/home_cubit.dart';

final getIt = GetIt.instance;

void setup() {

  getIt.registerLazySingleton<HomeCubit>(() =>HomeCubit(getIt<AddMessageUseCase>(),getIt<DeleteMessageUseCase>()));
  getIt.registerLazySingleton<AddMessageUseCase>(() =>AddMessageUseCase(getIt<HomeRepository>()) );
  getIt.registerLazySingleton<DeleteMessageUseCase>(() =>DeleteMessageUseCase(getIt<HomeRepository>()) );
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(getIt<HomeRemoteDataSource>()));
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeFirebaseDataSourceImp());
}