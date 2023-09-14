import 'dart:convert';
import 'dart:developer';
import 'package:get_it/get_it.dart';
import '/data/http/response_parser.dart';
import 'package:http/http.dart' as http;
import 'curl_base.dart' as curl;

class HTTPRequest {
  ResponseHandler? responseHandler = GetIt.I<ResponseHandler>();

  get(
      {required String url,
      Map<String, dynamic>? queryParameters,
      String? token}) async {
    try {
      var queryParam =
          queryParameters != null ? buildQuery(queryParameters) : '';
      var headers = {
        'Authorization': token ?? '',
        'Content-Type': 'application/json'
      };
      log(curl.toCurl(curl.MappedRequest(
        method: 'GET',
        url: '$url?$queryParam',
        headers: headers,
      )));
      var response = await http.get(
        Uri.parse('$url?$queryParam'),
        headers: headers,
      );
      print(response.body);
      var processedResponse = responseHandler?.processResponse(response);
      return returnResponse(processedResponse);
    } catch (e) {
      return e;
    }
  }

  post(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      String? token,
      Map<String, String>? header}) async {
    try {
      var headers = {
        'Authorization': token != null ? 'Bearer $token' : '',
        'Content-Type': 'application/json'
      };
      if (header != null) {
        headers.addAll(header);
      }
      log(curl.toCurl(curl.MappedRequest(
        method: 'POST',
        url: url,
        body: body,
        headers: headers,
      )));
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      log("From Post Http Page ${response.body}");
      var processedResponse = responseHandler?.processResponse(response);
      return returnResponse(processedResponse);
    } catch (e) {
      rethrow;
    }
  }

  returnResponse(MappedResponse mappedResponse) {
    if (mappedResponse.success) {
      return mappedResponse;
    } else {
      throw HttpCustomException(
          code: mappedResponse.code,
          message: mappedResponse.message,
          errorCode: mappedResponse.errorCode);
    }
  }

  String buildQuery(Map<String, dynamic> queryParameters) {
    String query = '';
    queryParameters.forEach((key, value) => query += '$key=$value&');
    return query.isNotEmpty ? query.substring(0, query.length - 1) : query;
  }
}

class ResponseHandler {
  processResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return MappedResponse<dynamic>(
          code: response.statusCode,
          success: true,
          message: 'success',
          content: response.body,
          headers: response.headers);
    } else if (response.statusCode == 503 || response.statusCode == 500) {
      throw HttpCustomException(
          code: response.statusCode,
          errorCode: response.statusCode.toString(),
          message: 'something went wrong');
    } else {
      var decodedRes = json.decode(response.body);
      throw
       ErrorResponse(
          response: decodedRes["response"],
          responseMessage: decodedRes['responseMessage'],
          data: decodedRes['data']);

      HttpCustomException(
          code: response.statusCode,
          errorCode: '400',
          message: parseErrorMessage(decodedRes));
    }
  }

  parseErrorMessage(body) {
    return 'something went wrong';
  }

  parseErrorCode(body) {
    return body['data']['status'].toString();
  }
}
