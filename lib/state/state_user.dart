import 'dart:convert';

import 'package:flabsen/models/model_employee.dart';
import 'package:flutter/material.dart';

import '../api/client.dart';

class StateUser with ChangeNotifier{
  StateUser(this.token){
    debugPrint(token);
    fetchUserData();
  }
  List<DataEmployee> _dataEmployee = [];
  List<DataEmployee> get dataEmployee{return [..._dataEmployee];}
  String token;
  final _apiClient = ApiClient();

  Future<void> fetchUserData() async{
    await _apiClient.dynamicRequest(
      url: 'https://bowindo.servehttp.com/employee/list?branch_id=%&department_id=%',
      // data: params,
      method: 'get',
      token: token,
      contentType: 'application/json',
      onErrorResponse: (message){

      },
      onGetData: (message, data) {
        // loadVerifyOtp = LoadState.isDone;
        // notifyListeners();
        ModelEmployeeResponse employeeResponse = ModelEmployeeResponse.fromJson(jsonDecode(data));
        _dataEmployee = employeeResponse.data!;
        notifyListeners();
        debugPrint('get data: $message, data: ${jsonEncode(_dataEmployee)}');
      },
    );
  }
}