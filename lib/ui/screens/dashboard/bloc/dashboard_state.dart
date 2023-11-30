import 'package:hr_emp_proj/data/week_wise_worked_hours_json.dart';

import '/domain/entities/attendance/attendance_records.dart';

import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../utils/hive_db/hive_db.dart';

enum BottomNavigationTabState { homeScreen, megaMenu, attendance, detailReports, profile }

class DashboardState {
  final String token;
  final bool isLoading;
  final bool isTokenExpired;
  final UserData userData;
  final hiveStorage = HiveStorage();
  final BottomNavigationTabState bottomNavigationTabState;
/////Dummy Work ///////////
  final AttendenceObject attendanceRecords;
  final WeekWiseWorkedHours workingHours;
  final bool workHourLoading;
////////////////////////////////////////////////////////////////

  DashboardState({
    required this.token,
    required this.isLoading,
    required this.isTokenExpired,
    required this.userData,
    required this.bottomNavigationTabState,
    required this.attendanceRecords,
    required this.workHourLoading,
    required this.workingHours,
  });

  factory DashboardState.init() => DashboardState(
        token: '',
        isLoading: false,
        isTokenExpired: false,
        userData: UserData(),
        bottomNavigationTabState: BottomNavigationTabState.homeScreen,
        attendanceRecords: AttendenceObject(),
        workHourLoading: false,
        workingHours: WeekWiseWorkedHours(
          mON: "00:00:00",
          tUE: "00:00:00",
          wED: "00:00:00",
          tHU: "00:00:00",
          fRI: "00:00:00",
          sAT: "00:00:00",
          sUN: "00:00:00",
        ),
      );

  DashboardState copyWith({
    String? token,
    bool? isLoading,
    bool? isTokenExpired,
    UserData? userData,
    BottomNavigationTabState? bottomNavigationTabState,
    AttendenceObject? attendanceRecords,
    WeekWiseWorkedHours? workingHours,
    bool? workHourLoading,
  }) {
    return DashboardState(
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      isTokenExpired: isTokenExpired ?? this.isTokenExpired,
      userData: userData ?? this.userData,
      bottomNavigationTabState:
          bottomNavigationTabState ?? this.bottomNavigationTabState,
      attendanceRecords: attendanceRecords ?? this.attendanceRecords,
      workHourLoading: workHourLoading ?? this.workHourLoading,
      workingHours: workingHours ?? this.workingHours,
    );
  }
}
