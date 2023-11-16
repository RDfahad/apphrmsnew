import 'package:hr_emp_proj/domain/entities/request_entity/request_detail_entity.dart';
import 'package:hr_emp_proj/domain/entities/request_entity/request_entity.dart';

abstract class RequestRepo {
  Future<RequestModel> getRequest();
  Future<RequestDetailModel> getRequestDetail(id);
}
