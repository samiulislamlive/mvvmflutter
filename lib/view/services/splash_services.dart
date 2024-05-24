

import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:mvvmflutter/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../../utils/route/routes_name.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async{

    getUserData().then((value) async{

      if(value.token == null || value.token == ''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }
      else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }

    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

}