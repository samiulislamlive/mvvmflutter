
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode next
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String msg){

    Fluttertoast.showToast(msg: msg);
  }

  static void flushBarErrorMessage(
      String message, BuildContext context,
      Color backgroundColor,
      Widget icon
      ){

    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      backgroundColor: backgroundColor,
      messageColor: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(15),
      flushbarPosition: FlushbarPosition.TOP,
      forwardAnimationCurve: Curves.decelerate,
      duration: Duration(seconds: 2),
      icon: icon,
    )..show(context));

  }

  static snackBar(BuildContext context, String msg){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg),
      backgroundColor: Colors.blue,
      )
    );
  }
}