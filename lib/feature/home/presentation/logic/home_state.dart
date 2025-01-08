part of 'home_cubit.dart';

 class HomeState {}

 class HomeInitial extends HomeState {}
 class AddMessageLoadState extends HomeState {}
 class AddMessageSucceedState extends HomeState {}
 class AddMessageErrorState extends HomeState {}
 class ChangBtnState extends HomeState {
  bool color;

  ChangBtnState(this.color);
}
