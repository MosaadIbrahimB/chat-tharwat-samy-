part of 'home_cubit.dart';

 class HomeState {}

 class HomeInitial extends HomeState {}
 class AddMessageLoadState extends HomeState {}
 class AddMessageSucceedState extends HomeState {
  final List<MessageModel> listMessage;

  AddMessageSucceedState({required this.listMessage});

 }
 class AddMessageErrorState extends HomeState {}
 class ChangBtnState extends HomeState {
  bool color;

  ChangBtnState(this.color);
}
class GetMessageSucceedState extends HomeState {

final List<MessageModel> listMessage;

 GetMessageSucceedState({required this.listMessage});
}

class DeleteMessageSucceedState extends HomeState {
 String msg ;
 DeleteMessageSucceedState(this.msg);

}
class DeleteMessageErrorState extends HomeState {
 String msg ;
 DeleteMessageErrorState(this.msg);
}