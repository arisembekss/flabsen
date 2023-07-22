// To parse this JSON data, do
//
//     final modelEmployeeResponse = modelEmployeeResponseFromJson(jsonString);

import 'dart:convert';

class ModelEmployeeResponse {
  bool? success;
  List<DataEmployee>? data;
  String? message;

  ModelEmployeeResponse({
    this.success,
    this.data,
    this.message,
  });

  factory ModelEmployeeResponse.fromRawJson(String str) => ModelEmployeeResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelEmployeeResponse.fromJson(Map<String, dynamic> json) => ModelEmployeeResponse(
    success: json["success"],
    data: List<DataEmployee>.from(json["data"].map((x) => DataEmployee.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class DataEmployee {
  int? employeeId;
  String? employeeName;
  String? employeeAddress;
  DateTime? employeeDob;
  String? employeeMail;
  int? departmentId;
  int? flagEmployee;
  String? branchId;
  String? branchName;
  String? departmentName;

  DataEmployee({
    this.employeeId,
    this.employeeName,
    this.employeeAddress,
    this.employeeDob,
    this.employeeMail,
    this.departmentId,
    this.flagEmployee,
    this.branchId,
    this.branchName,
    this.departmentName,
  });

  factory DataEmployee.fromRawJson(String str) => DataEmployee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataEmployee.fromJson(Map<String, dynamic> json) => DataEmployee(
    employeeId: json["employee_id"],
    employeeName: json["employee_name"],
    employeeAddress: json["employee_address"],
    employeeDob: DateTime.parse(json["employee_dob"]),
    employeeMail: json["employee_mail"],
    departmentId: json["department_id"],
    flagEmployee: json["flag_employee"],
    branchId: json["branch_id"],
    branchName: json["branch_name"],
    departmentName: json["department_name"],
  );

  Map<String, dynamic> toJson() => {
    "employee_id": employeeId,
    "employee_name": employeeName,
    "employee_address": employeeAddress,
    "employee_dob": "${employeeDob!.year.toString().padLeft(4, '0')}-${employeeDob!.month.toString().padLeft(2, '0')}-${employeeDob!.day.toString().padLeft(2, '0')}",
    "employee_mail": employeeMail,
    "department_id": departmentId,
    "flag_employee": flagEmployee,
    "branch_id": branchId,
    "branch_name": branchName,
    "department_name": departmentName,
  };
}
