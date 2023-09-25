import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/http/exception_handler.dart';
import '../../../../domain/repository/attendance_repo/attendance_repo.dart';
import '/ui/screens/attendance/cubit/attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final AttendanceRepo attendanceRepo;

  AttendanceCubit(this.attendanceRepo) : super(AttendanceState.init()) {
    getAttendance();
  }

  getAttendance() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await attendanceRepo.getAttendance(
          pageNumber: state.pageNumber, perPage: state.perPageQuantity);
      log("From AttendanceRecords response ${response.responseData!.attendenceObject!.data![0].checkInTime != null}");

      emit(state.copyWith(
          isLoading: false,
          attendanceRecords: response.responseData?.attendenceObject,
          pageNumber: state.pageNumber + 1,
          perPageQuantity: state.perPageQuantity));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      ExceptionHandler().handleException(e);
    }
  }

  getMoreAttendance() async {
    getAttendance();
    log("attendanceRecordScrollController call");
  }
}
////////////////////////////////////////////////////////////////////////////////

class PaginationCubit extends Cubit<PaginationState> {
  final AttendanceRepo attendanceRepo;

  PaginationCubit(this.attendanceRepo) : super(PaginationState.init()) {
    firstLoad();
    state.controller = ScrollController();
  }

  void firstLoad() async {
    try {
      final res = await attendanceRepo.getAttendance(
          pageNumber: state.page, perPage: state.limit);
      log("From AttendanceRecords response ${res.responseData!.attendenceObject!.data![0].checkInTime != null}");

      emit(state.copyWith(
          attendanceRecords: res.responseData?.attendenceObject));
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    emit(state.copyWith(isFirstLoadRunning: false));
  }

  void loadMore() async {
    if (state.hasNextPage &&
        !state.isFirstLoadRunning &&
        !state.isLoadMoreRunning) {
      emit(state.copyWith(isLoadMoreRunning: true));

      emit(state.copyWith(page: state.page + 1));

      try {
        final res = await attendanceRepo.getAttendance(
            pageNumber: state.page, perPage: state.limit);
        log("From AttendanceRecords load more ${res.responseData!.attendenceObject!.data![0].checkInTime != null}");

        final fetchedPosts = res.responseData!.attendenceObject;

        if (fetchedPosts!.data!.isNotEmpty) {
          emit(state.copyWith(attendanceRecords: fetchedPosts));
        } else {
          emit(state.copyWith(hasNextPage: false));
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      emit(state.copyWith(isLoadMoreRunning: false));
    }
  }
}
