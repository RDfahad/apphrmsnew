import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/http/exception_handler.dart';
import '../../../../domain/repository/attendance_repo/attendance_repo.dart';
import '/ui/screens/attendance/cubit/attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final AttendanceRepo attendanceRepo;

  AttendanceCubit(this.attendanceRepo) : super(AttendanceState.init());

  initState() {
    emit(AttendanceState.init());
  }

  getAttendance() async {
    if (!state.loadMore && state.errorCode != '995') {
      emit(state.copyWith(loadMore: true));
      await attendanceRepo
          .getAttendance(
              pageNumber: state.pageNumber, perPage: state.perPageQuantity)
          .then((response) {
        log("From AttendanceRecords response ${response.responseData!.attendenceObject!.data![0].checkInTime}");
        response.responseData?.attendenceObject?.data
            ?.addAll(state.attendanceRecords.data ?? []);
        response.responseData?.attendenceObject?.data
            ?.sort((a, b) => a.date!.compareTo(b.date!));
        // shouldCallAPI = true;
        emit(state.copyWith(
            loadMore: false,
            attendanceRecords: response.responseData?.attendenceObject,
            pageNumber: state.pageNumber + 1,
            perPageQuantity: state.perPageQuantity));
      }, onError: (e) {
        log('From Attens ${e.errorCode}');
        ExceptionHandler().handleException(e);
        emit(state.copyWith(loadMore: false, errorCode: e.errorCode));
      });
    }
  }

  @override
  Future<void> close() {
    emit(AttendanceState.init());
    return super.close();
  }
}
////////////////////////////////////////////////////////////////////////////////
