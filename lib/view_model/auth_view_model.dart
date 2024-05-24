
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmflutter/repository/auth_repository.dart';

import '../utils/utils.dart';

class AuthViewMode with ChangeNotifier{

  final _myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context, Colors.red, Icon(Icons.error));
        print(error.toString());
      }
    });

  }

}