import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';
import 'package:hr_emp_proj/domain/entities/authentication_entities/refresh_token.dart';
import 'package:hr_emp_proj/domain/repository/attendance_repo/attendance_repo.dart';
import '../../../../data/http/exception_handler.dart';
import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../domain/repository/authentication_repo/authentication_repo.dart';
import '../../../../utils/configuration.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final AuthenticationRepo authenticationRepo;
  final AttendanceRepo attendanceRepo;

  DashboardCubit(this.authenticationRepo, this.attendanceRepo)
      : super(DashboardState.init());

  Future<void> refreshToken() async {
    try {
      emit(state.copyWith(isLoading: true));
      var userModel = state.hiveStorage.getData("userdata");
      log(userModel.toString());
      var userData = userModel != null
          ? UserData.fromJson(jsonDecode(userModel ?? ''))
          : null;
      Config.authorization = userData?.token ?? '';
      if (Config.isLoggedIn) {
        RefreshToken tokenData = await authenticationRepo.refreshToken();
        Config.authorization = tokenData.data?.token ?? '';
        userData = UserData(
            user: userData!.user,
            token: tokenData.data?.token,
            tokenType: tokenData.data?.tokenType);
        state.hiveStorage.putData("userdata", jsonEncode(userData.toJson()));
      }
      await getAttendance();
      emit(state.copyWith(isLoading: false, userData: userData));
    } catch (e) {
      ExceptionHandler().handleException(e);
      emit(state.copyWith(isLoading: false));
    }
  }

  getAttendance() async {
    try {
      AttendanceRecords response = await attendanceRepo.getAttendance();
      log("From AttendanceRecords response ${response.responseData!.attendenceObject!.data![0].checkInTime}");
      emit(state.copyWith(attendanceRecords: response.responseData?.attendenceObject));
    } catch (e) {
      ExceptionHandler().handleException(e);
    }
  }

  void changeTab(BottomNavigationTabState bottomNavigationTabState) =>
      emit(state.copyWith(bottomNavigationTabState: bottomNavigationTabState));
}
