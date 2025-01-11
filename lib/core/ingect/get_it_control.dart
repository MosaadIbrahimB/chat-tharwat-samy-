import 'export_inject_import.dart';

final getIt = GetIt.instance;

void setup() {
  /// LOGIN
  getIt.registerLazySingleton<LoginCubit>(() =>LoginCubit(getIt<LoginUseCase>()));
  getIt.registerLazySingleton<LoginUseCase>(() =>LoginUseCase(getIt<LoginRepository>()) );
  getIt.registerLazySingleton<LoginRepository>(() =>LoginRepositoryImp(getIt<LoginRemoteDataSource>()) );
  getIt.registerLazySingleton<LoginRemoteDataSource>(() =>LoginFirebaseDataSourceImp() );


/// HOME
  getIt.registerLazySingleton<HomeCubit>(() =>HomeCubit(getIt<AddMessageUseCase>(),getIt<DeleteMessageUseCase>()));
  getIt.registerLazySingleton<AddMessageUseCase>(() =>AddMessageUseCase(getIt<HomeRepository>()) );
  getIt.registerLazySingleton<DeleteMessageUseCase>(() =>DeleteMessageUseCase(getIt<HomeRepository>()) );
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(getIt<HomeRemoteDataSource>()));
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeFirebaseDataSourceImp());
}
