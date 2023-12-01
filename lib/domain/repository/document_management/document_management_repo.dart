import '../../entities/document_management/employee_document.dart';

abstract class DocumentManagementRepo {
  Future<EmployeeDocument> getDocument();
}
