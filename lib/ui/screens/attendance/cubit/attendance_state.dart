import 'package:flutter/material.dart';
import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';


class AttendanceState {
  final bool loadMore;
  final AttendenceObject attendanceRecords;
  int pageNumber;
  int perPageQuantity;
  ScrollController attendanceRecordScrollController = ScrollController();

  AttendanceState({required this.loadMore, required this.attendanceRecords,required this.pageNumber, required this.perPageQuantity});

  factory AttendanceState.init() => AttendanceState(loadMore: false, attendanceRecords: AttendenceObject(data: <AttendenceData>[]),pageNumber: 1,perPageQuantity: 6);

  AttendanceState copyWith({
  bool? loadMore,
  AttendenceObject? attendanceRecords,
  int? pageNumber,
  int? perPageQuantity,
  }){
    return AttendanceState(
        loadMore: loadMore ?? this.loadMore,
        attendanceRecords: attendanceRecords ?? this.attendanceRecords,
        pageNumber: pageNumber ?? this.pageNumber,
        perPageQuantity: perPageQuantity ?? this.perPageQuantity
    );
  }
}
