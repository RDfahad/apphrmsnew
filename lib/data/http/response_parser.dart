import 'dart:io';

// class ErrorResponse {
//   bool? response;
//   String? responseMessage;
//   ErrorData? data;

//   ErrorResponse({this.response, this.responseMessage, this.data});

//   ErrorResponse.fromJson(Map<String, dynamic> json) {
//     response = json['response'];
//     responseMessage = json['responseMessage'];
//     // data = json['data'] != null ? ErrorData.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['response'] = response;
//     data['responseMessage'] = responseMessage;
//     // if (this.data != null) {
//     //   data['data'] = this.data!.toJson();
//     // }
//     return data;
//   }
// }

class ErrorResponse {
  ErrorResponse({
    required this.response,
    required this.responseMessage,
    required this.data,
  });
  late final bool response;
  late final String responseMessage;
  late final List<dynamic> data;

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    responseMessage = json['responseMessage'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['response'] = response;
    data['responseMessage'] = responseMessage;
    data['data'] = data;
    return data;
  }

  @override
  String toString() {
    var b = StringBuffer()..write(responseMessage);
    return b.toString();
  }
}

class ErrorData {
  int? status;

  ErrorData({this.status});

  ErrorData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

  HttpCustomException(
      {this.code, this.message, this.errorCode = '', this.title});

  @override
  String toString() {
    var b = StringBuffer()..write(message);
    return b.toString();
  }
}
