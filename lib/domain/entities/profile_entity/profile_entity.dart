class ProfileModel {
  bool? success;
  String? responseMessage;
  String? responseCode;
  ResponseData? responseData;

  ProfileModel(
      {this.success,
      this.responseMessage,
      this.responseCode,
      this.responseData});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    responseData = json['responseData'] != null
        ? ResponseData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['responseMessage'] = responseMessage;
    data['responseCode'] = responseCode;
    if (responseData != null) {
      data['responseData'] = responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? url;

  ResponseData({this.url});

  ResponseData.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
