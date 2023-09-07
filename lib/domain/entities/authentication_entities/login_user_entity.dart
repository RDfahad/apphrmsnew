class LoginUser {
  bool? success;
  int? statusCode;
  String? code;
  String? message;
  Data? data;

  LoginUser(
      {this.success, this.statusCode, this.code, this.message, this.data});

  LoginUser.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  int? id;
  String? email;
  String? niceName;
  String? firstName;
  String? lastName;
  String? displayName;

  Data(
      {this.token,
        this.id,
        this.email,
        this.niceName,
        this.firstName,
        this.lastName,
        this.displayName});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    email = json['email'];
    niceName = json['nicename'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['email'] = email;
    data['nicename'] = niceName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['displayName'] = displayName;
    return data;
  }
}