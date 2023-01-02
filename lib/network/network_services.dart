import 'dart:convert';
import 'package:dio/dio.dart';
import '../apputils/utility.dart';
import 'network_path.dart';

class NetworkServices {
  static Dio dio = Dio();
  static String contentType = 'application/json; charset=UTF-8';
  static logRequest({required url, required req, required res, required type}){
    printLog('req$type, $url, $req');
    printLog('res$type, $res');
  }

  static Future<Map<String, dynamic>> createRequestLogin(Map<String, dynamic> requestBody) async{
    late Map<String, dynamic> responseData;
    var response = await dio.post(urlLogin, data: jsonEncode(requestBody), options: Options(
      headers: {
        'Content-Type': contentType
      }
    ));
    logRequest(url: urlLogin, req: requestBody, res: response.data, type: 'login');
    if(response.statusCode==200){
      try{
        responseData = response.data;
      }catch(_){}
    }

    return responseData;
  }
}