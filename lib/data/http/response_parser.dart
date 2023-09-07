import 'dart:io';

class ErrorResponse {
  String? code;
  String? message;
  ErrorData? data;

  ErrorResponse({this.code, this.message, this.data});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? ErrorData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ErrorData {
  int? status;

  ErrorData({this.status});

  ErrorData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    return data;
  }
}

// class CustomResponse{
//   dynamic content
// }

class MappedResponse<T> {
  int? code;
  bool success;
  dynamic content;
  dynamic headers;
  String? message;
  String errorCode;
  String? title;

  MappedResponse(
      {this.code,
        this.content,
        this.headers,
        this.message,
        this.success = false,
        this.errorCode = '',
        this.title});
}

class HttpCustomException implements IOException {
  int? code;
  String? message;
  String errorCode;
  String? title;

  HttpCustomException({this.code, this.message, this.errorCode = '', this.title});

  @override
  String toString() {
    var b = StringBuffer()..write(message);
    return b.toString();
  }
}