import 'package:hr_emp_proj/data/week_wise_worked_hours_json.dart';

import '/domain/entities/attendance/attendance_records.dart';

abstract class AttendanceRepo {
  Future<AttendanceRecords> getAttendance({int? perPage, int? pageNumber});
  Future<WeekWiseWorkedHours> getWorkingHoursApi();
}
