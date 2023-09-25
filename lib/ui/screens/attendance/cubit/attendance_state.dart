import 'package:flutter/material.dart';
import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';

class AttendanceState {
  final bool isLoading;
  final AttendenceObject attendanceRecords;
  int pageNumber;
  int perPageQuantity;
  ////////////////////////////////

  AttendanceState({
    required this.isLoading,
    required this.attendanceRecords,
    required this.pageNumber,
    required this.perPageQuantity,
  });

  factory AttendanceState.init() => AttendanceState(
        isLoading: false,
        attendanceRecords: AttendenceObject(),
        pageNumber: 0,
        perPageQuantity: 6,
      );

  AttendanceState copyWith({
    bool? isLoading,
    AttendenceObject? attendanceRecords,
    int? pageNumber,
    int? perPageQuantity,
    bool? hasNextPage,
  }) {
    return AttendanceState(
      isLoading: isLoading ?? this.isLoading,
      attendanceRecords: attendanceRecords ?? this.attendanceRecords,
      pageNumber: pageNumber ?? this.pageNumber,
      perPageQuantity: perPageQuantity ?? this.perPageQuantity,
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class PaginationState {
  final int page;
  final int limit;
  final bool isFirstLoadRunning;
  final bool hasNextPage;
  final bool isLoadMoreRunning;
  final AttendenceObject attendanceRecords;
  ScrollController controller;

  PaginationState({
    required this.page,
    required this.limit,
    required this.isFirstLoadRunning,
    required this.hasNextPage,
    required this.isLoadMoreRunning,
    required this.attendanceRecords,
    required this.controller,
  });

  factory PaginationState.init() => PaginationState(
        page: 0,
        limit: 6,
        isFirstLoadRunning: false,
        hasNextPage: true,
        isLoadMoreRunning: false,
        attendanceRecords: AttendenceObject(),
        controller: ScrollController(),
      );

  PaginationState copyWith({
    int? page,
    int? limit,
    bool? isFirstLoadRunning,
    bool? hasNextPage,
    bool? isLoadMoreRunning,
    AttendenceObject? attendanceRecords,
    ScrollController? controller,
  }) {
    return PaginationState(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      isFirstLoadRunning: isFirstLoadRunning ?? this.isFirstLoadRunning,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoadMoreRunning: isLoadMoreRunning ?? this.isLoadMoreRunning,
      attendanceRecords: attendanceRecords ?? this.attendanceRecords,
      controller: controller ?? this.controller,
    );
  }
}
