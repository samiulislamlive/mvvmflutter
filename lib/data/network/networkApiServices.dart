import 'dart:convert';
import 'dart:io';

import 'package:mvvmflutter/data/appException.dart';
import 'package:mvvmflutter/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiResponses extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = responseReturn(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {

      http.Response response = await http.post(Uri.parse(url),
      body: data
      ).timeout(Duration(seconds: 10));

      responseJson = responseReturn(response);
      
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  dynamic responseReturn(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error Occured while getting data with status code" +
                response.body.toString() +
                response.statusCode.toString());
    }
  }
}
