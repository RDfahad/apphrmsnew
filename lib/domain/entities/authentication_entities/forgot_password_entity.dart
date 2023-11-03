class ForgotPasswordModel {
  bool? success;
  String? responseMessage;
  String? responseCode;
  List<Null>? data;

  ForgotPasswordModel({this.success, this.responseMessage, this.responseCode, this.data});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    if (json['data'] != null) {
      data = <Null>[];
      json['data'].forEach((v) {});
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['responseMessage'] = this.responseMessage;
    data['responseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    return data;
  }
}
