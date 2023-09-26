class LoginUserModel {
  bool? response;
  String? responseMessage;
  UserData? data;

  LoginUserModel({this.response, this.responseMessage, this.data});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    responseMessage = json['responseMessage'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    data['responseMessage'] = responseMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  User? user;
  String? token;
  String? tokenType;

  UserData({this.user, this.token, this.tokenType});

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? joiningDate;
  String? designation;
  String? image;

  User(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.joiningDate,
      this.designation});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    joiningDate = json['joining_date'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['joining_date'] = joiningDate;
    data['designation'] = designation;
    return data;
  }
}
