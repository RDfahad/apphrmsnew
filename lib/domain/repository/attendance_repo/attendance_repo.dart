import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';

abstract class AttendanceRepo {
  Future<AttendanceRecords> getAttendance();
}
