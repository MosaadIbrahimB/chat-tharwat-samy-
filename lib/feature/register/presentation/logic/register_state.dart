part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  String? msg;

  RegisterError({this.msg});
}

class RegisterSucceed extends RegisterState {
  UserCredential ?userCredential;

  RegisterSucceed({this.userCredential});
}
