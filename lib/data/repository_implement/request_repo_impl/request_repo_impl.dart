import 'dart:convert';

import 'package:hr_emp_proj/domain/entities/request_entity/request_detail_entity.dart';
import 'package:hr_emp_proj/domain/entities/request_entity/request_entity.dart';
import 'package:hr_emp_proj/utils/configuration.dart';
import 'package:hr_emp_proj/utils/constants.dart';

import '../../../domain/repository/request_repo/request_repo.dart';
import '../../../ui/screens/dashboard/bloc/dashboard_bloc.dart';
import '../../../utils/paths.dart';
import '../../http/http.dart';

class RequestRepoImpl implements RequestRepo {
  final HTTPRequest? httpRequest;

  RequestRepoImpl({required this.httpRequest});
  @override
  Future<RequestModel> getRequest() async {
    try {
      var response = await httpRequest?.get(
        url: paths.getRequestUrl,
        token: Config.authorization,
      );
      var decodedRes = json.decode(response.content);
      return RequestModel.fromJson(decodedRes);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<RequestDetailModel> getRequestDetail(id) async {
    try {
      var params = {'id': id};
      var response = await httpRequest?.get(
          url: paths.getRequestDetailUrl, token: Config.authorization, queryParameters: params);
      var decodedRes = json.decode(response.content);
      return RequestDetailModel.fromJson(decodedRes);
    } catch (e) {
      return Future.error(e);
    }
  }
}
