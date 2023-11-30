import 'dart:convert';
import 'package:hr_emp_proj/data/week_wise_worked_hours_json.dart';

import '/domain/entities/attendance/attendance_records.dart';
import '../../../domain/repository/attendance_repo/attendance_repo.dart';
import '/utils/configuration.dart';
import '../../../utils/paths.dart';
import '../../http/http.dart';

class AttendanceRepoImpl implements AttendanceRepo {
  final HTTPRequest? httpRequest;
  AttendanceRepoImpl({required this.httpRequest});

  @override
  Future<AttendanceRecords> getAttendance(
      {int? perPage, int? pageNumber}) async {
    try {
      //this should be get
      var queryParams = {
        "page": pageNumber ?? 0,
        "per_page": perPage ?? 6,
      };
      var response = await httpRequest?.get(
        url: paths.getAttendanceRecord,
        token: Config.authorization,
        queryParameters: queryParams,
      );
      return AttendanceRecords.fromJson(json.decode(response.content) ?? {});
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<WeekWiseWorkedHours> getWorkingHoursApi() async {
    try {
      //this should be get
    
      var response = await httpRequest?.get(
          url: paths.workingHoursURL, token: Config.authorization);
      var workedHours = jsonDecode(response.content);
      return WeekWiseWorkedHours.fromJson(workedHours['responseData']['weekWiseWorkedHours']);
    } catch (e) {
      return Future.error(e);
    }
  }
}
