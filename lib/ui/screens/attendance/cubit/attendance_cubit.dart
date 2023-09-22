

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/http/exception_handler.dart';
import '../../../../domain/entities/attendance/attendance_records.dart';
import '../../../../domain/repository/attendance_repo/attendance_repo.dart';
import '/ui/screens/attendance/cubit/attendance_state.dart';

ScrollController attendanceRecordScrollController = ScrollController();
class AttendanceCubit extends Cubit<AttendanceState> {
  final AttendanceRepo attendanceRepo;

  AttendanceCubit(this.attendanceRepo) : super(AttendanceState.init()){
    getAttendance();
  }

  scrollControllerListner()async{
    attendanceRecordScrollController.addListener(() {
      print('scrolled');
      print('scrolled');
    });
  }

  getAttendance() async {
    try {
      emit(state.copyWith(isLoading: true));
      AttendanceRecords response = await attendanceRepo.getAttendance(pageNumber: state.pageNumber, perPage: state.perPageQuantity);
      log("From AttendanceRecords response ${response.responseData!.attendenceObject!.data![0].checkInTime}");
      scrollControllerListner();
      emit(state.copyWith(isLoading: false,attendanceRecords: response.responseData?.attendenceObject,pageNumber: state.pageNumber +1, perPageQuantity: state.perPageQuantity));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      ExceptionHandler().handleException(e);
    }
  }
}
