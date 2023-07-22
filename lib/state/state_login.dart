import 'dart:convert';

import 'package:flabsen/api/client.dart';
import 'package:flabsen/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

enum LoadState{initialize, loading, done, error}
class StateLogin with ChangeNotifier{
  StateLogin();
  TextEditingController unameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var loadingLogin = LoadState.initialize;
  String loginToken = '';
  String errorMesssage = '';
  final _apiClient = ApiClient();

  Future<void> prosesLogin() async{
    /// 'mocktest123'
    loadingLogin = LoadState.loading;
    notifyListeners();
    var pass = sha256.convert(utf8.encode(passController.text.toString())).toString();
    Map<String, dynamic> params = {
      "user_id": unameController.text.toString(),
      "user_password": pass
    };
    await _apiClient.dynamicRequest(
      url: 'https://bowindo.servehttp.com/login',
      data: params,
      method: 'post',
      token: '',
      contentType: 'application/json',
      onErrorResponse: (message){
        debugPrint('error tirggered');
        errorMesssage = message;
        loadingLogin = LoadState.error;
        notifyListeners();
      },
      onGetData: (message, data) {
        // loadVerifyOtp = LoadState.isDone;
        // notifyListeners();
        ModelLoginResponse loginResponse = ModelLoginResponse.fromJson(jsonDecode(data));
        loginToken = loginResponse.token!;
        loadingLogin = LoadState.done;
        notifyListeners();
        debugPrint('get data: $message, data: ${jsonEncode(loginResponse)}, token: ${loginResponse.token}');
      },
    );
  }
}