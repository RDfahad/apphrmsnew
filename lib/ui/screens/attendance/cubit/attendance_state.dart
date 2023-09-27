import 'package:flutter/material.dart';
import '/domain/entities/attendance/attendance_records.dart';

class AttendanceState {
  final bool loadMore;
  final AttendenceObject attendanceRecords;
  int pageNumber;
  int perPageQuantity;
  ScrollController attendanceRecordScrollController = ScrollController();
  final String? errorMessage;

  AttendanceState({
    required this.loadMore,
    required this.attendanceRecords,
    required this.pageNumber,
    required this.perPageQuantity,
    required this.errorMessage,
  });

  factory AttendanceState.init() => AttendanceState(
      errorMessage: null,
      loadMore: false,
      attendanceRecords: AttendenceObject(data: <AttendenceData>[]),
      pageNumber: 1,
      perPageQuantity: 8);

  AttendanceState copyWith({
    bool? loadMore,
    AttendenceObject? attendanceRecords,
    int? pageNumber,
    int? perPageQuantity,
    String? errorMessage,
  }) {
    return AttendanceState(
      loadMore: loadMore ?? this.loadMore,
      attendanceRecords: attendanceRecords ?? this.attendanceRecords,
      pageNumber: pageNumber ?? this.pageNumber,
      perPageQuantity: perPageQuantity ?? this.perPageQuantity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
