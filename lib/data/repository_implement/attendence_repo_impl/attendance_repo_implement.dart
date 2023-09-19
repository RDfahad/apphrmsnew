import 'dart:convert';
import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';
import '../../../domain/repository/attendance_repo/attendance_repo.dart';
import '/utils/configuration.dart';
import '../../../utils/paths.dart';
import '../../http/http.dart';

class AttendanceRepoImpl implements AttendanceRepo {
  final HTTPRequest? httpRequest;
  AttendanceRepoImpl({required this.httpRequest});

  @override
  Future<AttendanceRecords> getAttendance() async {
    try {
      var response = await httpRequest?.post(
          url: paths.getAttendanceRecord, token: Config.token);
      return AttendanceRecords.fromJson(json.decode(response.content) ?? {});
    } catch (e) {
      return Future.error(e);
    }
  }

}
