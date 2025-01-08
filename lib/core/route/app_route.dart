import 'package:chat/core/route/screen_name.dart';
import 'package:chat/feature/home/presentation/screen/home_screen.dart';
import 'package:chat/feature/login/presentation/screen/login_screen.dart';
import 'package:chat/feature/register/presentation/screen/register_screen.dart';
import 'package:flutter/material.dart';
import '../widget/default_screen.dart';


class AppRoute{

 static  Route<dynamic>? onGenerateRoute(RouteSettings  routeSettings){


    switch(routeSettings.name){
      case ScreenName.register:return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case ScreenName.login:return MaterialPageRoute(builder: (context) => const LoginScreen());
      case ScreenName.home:return MaterialPageRoute(builder: (context) => HomeScreen());
      default:return MaterialPageRoute(builder: (context) => const DefaultScreen());
    }
  }



}


