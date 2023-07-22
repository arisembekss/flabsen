// To parse this JSON data, do
//
//     final modelLoginResponse = modelLoginResponseFromJson(jsonString);

import 'dart:convert';

class ModelLoginResponse {
  bool? success;
  String? message;
  Data? data;
  String? token;
  String? refresh;

  ModelLoginResponse({
    this.success,
    this.message,
    this.data,
    this.token,
    this.refresh,
  });

  factory ModelLoginResponse.fromRawJson(String str) => ModelLoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelLoginResponse.fromJson(Map<String, dynamic> json) => ModelLoginResponse(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
    refresh: json["refresh"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data!.toJson(),
    "token": token,
    "refresh": refresh,
  };
}

class Data {
  String? userId;
  String? userName;
  int? levelId;
  dynamic userMail;
  String? branchId;
  String? levelName;
  dynamic userMenu;
  int? storeId;
  String? storeName;
  String? storeAddress;
  String? storePhone;
  int? flagStore;
  dynamic storeTaxId;
  dynamic pkpDate;
  int? isPkp;
  dynamic ledgerDate;
  int? allowMinusTransaction;
  dynamic lastAllowedDate;
  int? printSizeDefault;
  String? taxRatio;
  dynamic validUntil;

  Data({
    this.userId,
    this.userName,
    this.levelId,
    this.userMail,
    this.branchId,
    this.levelName,
    this.userMenu,
    this.storeId,
    this.storeName,
    this.storeAddress,
    this.storePhone,
    this.flagStore,
    this.storeTaxId,
    this.pkpDate,
    this.isPkp,
    this.ledgerDate,
    this.allowMinusTransaction,
    this.lastAllowedDate,
    this.printSizeDefault,
    this.taxRatio,
    this.validUntil,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    userName: json["user_name"],
    levelId: json["level_id"],
    userMail: json["user_mail"],
    branchId: json["branch_id"],
    levelName: json["level_name"],
    userMenu: json["user_menu"],
    storeId: json["store_id"],
    storeName: json["store_name"],
    storeAddress: json["store_address"],
    storePhone: json["store_phone"],
    flagStore: json["flag_store"],
    storeTaxId: json["store_tax_id"],
    pkpDate: json["pkp_date"],
    isPkp: json["is_pkp"],
    ledgerDate: json["ledger_date"],
    allowMinusTransaction: json["allow_minus_transaction"],
    lastAllowedDate: json["last_allowed_date"],
    printSizeDefault: json["print_size_default"],
    taxRatio: json["tax_ratio"],
    validUntil: json["valid_until"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "level_id": levelId,
    "user_mail": userMail,
    "branch_id": branchId,
    "level_name": levelName,
    "user_menu": userMenu,
    "store_id": storeId,
    "store_name": storeName,
    "store_address": storeAddress,
    "store_phone": storePhone,
    "flag_store": flagStore,
    "store_tax_id": storeTaxId,
    "pkp_date": pkpDate,
    "is_pkp": isPkp,
    "ledger_date": ledgerDate,
    "allow_minus_transaction": allowMinusTransaction,
    "last_allowed_date": lastAllowedDate,
    "print_size_default": printSizeDefault,
    "tax_ratio": taxRatio,
    "valid_until": validUntil,
  };
}
