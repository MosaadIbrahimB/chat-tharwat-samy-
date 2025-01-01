part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  String? msg;

  LoginError({this.msg});
}

class LoginSucceed extends LoginState {
  UserCredential ?userCredential;

  LoginSucceed({this.userCredential});
}
