import 'package:chat/feature/register/data/data_source/register_remote_data_source.dart';
import 'package:chat/feature/register/data/repository/register_repository_imp.dart';
import 'package:chat/feature/register/domain/repository/register_repository.dart';
import 'package:chat/feature/register/domain/use_case/register_use_case.dart';
import 'package:chat/feature/register/presentation/logic/register_cubit.dart';

import 'export_inject_import.dart';

final getIt = GetIt.instance;

void setup() {
  /// LOGIN
  getIt.registerLazySingleton<LoginCubit>(() =>LoginCubit(getIt<LoginUseCase>()));
  getIt.registerLazySingleton<LoginUseCase>(() =>LoginUseCase(getIt<LoginRepository>()) );
  getIt.registerLazySingleton<LoginRepository>(() =>LoginRepositoryImp(getIt<LoginRemoteDataSource>()) );
  getIt.registerLazySingleton<LoginRemoteDataSource>(() =>LoginFirebaseDataSourceImp() );
///  Register
  getIt.registerLazySingleton<RegisterCubit>(() =>RegisterCubit(getIt<RegisterUseCase>()));
  getIt.registerLazySingleton<RegisterUseCase>(() =>RegisterUseCase(getIt<RegisterRepository>()) );
  getIt.registerLazySingleton<RegisterRepository>(() =>RegisterRepositoryImp(getIt<RegisterRemoteDataSource>()) );
  getIt.registerLazySingleton<RegisterRemoteDataSource>(() =>RegisterFirebaseDataSourceImp());


/// HOME
  getIt.registerLazySingleton<HomeCubit>(() =>HomeCubit(getIt<AddMessageUseCase>(),getIt<DeleteMessageUseCase>()));
  getIt.registerLazySingleton<AddMessageUseCase>(() =>AddMessageUseCase(getIt<HomeRepository>()) );
  getIt.registerLazySingleton<DeleteMessageUseCase>(() =>DeleteMessageUseCase(getIt<HomeRepository>()) );
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(getIt<HomeRemoteDataSource>()));
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeFirebaseDataSourceImp());
}
