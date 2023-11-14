import 'package:hr_emp_proj/domain/entities/request_entity/request_entity.dart';

abstract class RequestRepo {
  Future<RequestModel> getRequest();
}
