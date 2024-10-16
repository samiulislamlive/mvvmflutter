

import 'package:flutter/material.dart';
import 'package:mvvmflutter/view/home.dart';
import 'package:mvvmflutter/view/login.dart';
import 'package:mvvmflutter/view/splash.dart';

import 'routes_name.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => Login());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => Home());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => Splash());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No routes are defined"),
            ),
          );
        });
    }

  }

}