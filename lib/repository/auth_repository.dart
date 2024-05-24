

import 'package:mvvmflutter/data/network/baseApiServices.dart';
import 'package:mvvmflutter/resource/api_urls.dart';

import '../data/network/networkApiServices.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(ApiUrls.loginUrl, data);
      return response;
    }catch(e){
      throw e;
    }

  }

  Future<dynamic> registerApi(dynamic data) async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(ApiUrls.registerUrl, data);
      return response;
    }catch(e){
      throw e;
    }

  }

}