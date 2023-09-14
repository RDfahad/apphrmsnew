class RefreshToken {
  bool? response;
  String? responseMessage;
  TokenData? data;

  RefreshToken({this.response, this.responseMessage, this.data});

  RefreshToken.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    responseMessage = json['responseMessage'];
    data = json['data'] != null ? TokenData.fromJson(json['data']) : null;
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

class TokenData {
  String? token;
  String? tokenType;

  TokenData({this.token, this.tokenType});

  TokenData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}
