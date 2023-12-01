import 'dart:convert';

import 'package:hr_emp_proj/domain/entities/document_management/employee_document.dart';
import 'package:hr_emp_proj/domain/repository/document_management/document_management_repo.dart';
import '../../../utils/configuration.dart';
import '../../../utils/paths.dart';
import '../../http/http.dart';

class DocumentManagementRepoImpl implements DocumentManagementRepo {
  final HTTPRequest? httpRequest;

  DocumentManagementRepoImpl({required this.httpRequest});
  @override
  Future<EmployeeDocument> getDocument() async {
    try {
      var response = await httpRequest?.get(
        url: paths.getDocument,
        token: Config.authorization,
        // queryParameters: queryParams,
      );
      return EmployeeDocument.fromJson(json.decode(response.content) ?? {});
    } catch (e) {
      return Future.error(e);
    }
  }
}
