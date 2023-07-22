import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiClient{
  Future<void> dynamicRequest({
    required String url,
    required String method,
    required String token,
    required String contentType,
    data,
    Function(String)? onErrorResponse,
    Function(String, String)? onGetData}) async {
    var dio = Dio();
    var header = {
      'token': token,
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: contentType,
    };
    // var response;
    try {
      var response = contentType == "application/json"
          ? await dio.request(
        url,
        queryParameters: data,
        options: Options(
          method: method,
          headers: header,
        ),
      )
          : await dio.request(
        url,
        data: data,
        options: Options(
          method: method,
          headers: header,
        ),
      );
      if (response.data['success'] == false) {
        onErrorResponse!(response.data['message']);
      } else{
        /// onGetData return [message, data]
        onGetData!(response.data['message'], jsonEncode(response.data));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        onErrorResponse!(jsonEncode(e.response!.data['message']));
        debugPrint('dio response: ${jsonEncode(e.response!.data)}');
      } else {
        debugPrint('dio error :${e.message}');
      }
    }
  }
}