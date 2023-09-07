import 'dart:async';
import 'dart:io';

import 'package:hr_emp_proj/data/http/response_parser.dart';
import 'package:http/http.dart';

class ExceptionData {
  String? title;
  String? message;
  int code;
  String apiCode;

  ExceptionData({this.title, this.message, this.code = -1, this.apiCode = ""});
}

class ExceptionHandler {
  // final globalCache = Get.find<GlobalCache>();
  static final ExceptionHandler _exceptionHandler =
  ExceptionHandler._internal();

  ExceptionHandler._internal();

  factory ExceptionHandler() => _exceptionHandler;

  Future<ExceptionData> handleException(Object e,
      {bool showDialog = true,
        Function? onTapRoute,
        String? analyticsEventName}) async {
    //If object e is not Exception type but error type
    if (e is! Exception) {
      e = Exception(e.toString());
    }
    var data = _makeException(e);

    return data;
  }

  ExceptionData _makeException(Exception e) {
    switch (e.runtimeType) {
      case TimeoutException:
        return ExceptionData(
            title: "Failed",
            message: 'error timeout'
          // "checkYourInternetConnection".tr
        );
      case SocketException:
        return ExceptionData(
            title: "Failed",
            message: 'check your internet connection');
      case ClientException:
        return ExceptionData(
            title: "Failed", message: "process request failed due to some error");
      case HttpException:
        return ExceptionData(
            title: "Failed", message: (e as HttpCustomException).message!);

      case HttpCustomException:
        HttpCustomException error = e as HttpCustomException;
        return ExceptionData(
          title: "Failed",
          message: error.message!,
          code: error.code!,
          apiCode: error.errorCode,
        );
      default:
        return ExceptionData(
            title: "Failed", message: "process request failed due to some error");
    }
  }

}