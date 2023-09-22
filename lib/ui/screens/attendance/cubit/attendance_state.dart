import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';

class AttendanceState {
  final bool isLoading;
  final AttendenceObject attendanceRecords;
  int pageNumber;
  int perPageQuantity;

  AttendanceState({required this.isLoading, required this.attendanceRecords,required this.pageNumber, required this.perPageQuantity});

  factory AttendanceState.init() => AttendanceState(isLoading: false, attendanceRecords: AttendenceObject(),pageNumber: 0,perPageQuantity: 6);

  AttendanceState copyWith({
  bool? isLoading,
  AttendenceObject? attendanceRecords,
  int? pageNumber,
  int? perPageQuantity,
  }){
    return AttendanceState(
        isLoading: isLoading ?? this.isLoading,
        attendanceRecords: attendanceRecords ?? this.attendanceRecords,
        pageNumber: pageNumber ?? this.pageNumber,
        perPageQuantity: perPageQuantity ?? this.perPageQuantity
    );
  }
}
