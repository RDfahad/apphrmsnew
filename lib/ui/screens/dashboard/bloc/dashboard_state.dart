import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';

import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../utils/hive_db/hive_db.dart';

enum BottomNavigationTabState {
  homeScreen,
  attendance,
  detailReports,
  profile,
  setting
}

class DashboardState {
  final String token;
  final bool isLoading;
  final UserData userData;
  final hiveStorage = HiveStorage();
  final BottomNavigationTabState bottomNavigationTabState;
/////Dummy Work ///////////
  final AttendenceObject attendanceRecords;

////////////////////////////////////////////////////////////////

  DashboardState({
    required this.token,
    required this.isLoading,
    required this.userData,
    required this.bottomNavigationTabState,
    required this.attendanceRecords,
  });

  factory DashboardState.init() => DashboardState(
        token: '',
        isLoading: false,
        userData: UserData(),
        bottomNavigationTabState: BottomNavigationTabState.homeScreen,
        attendanceRecords: AttendenceObject(),
      );

  DashboardState copyWith(
      {String? token,
      bool? isLoading,
      UserData? userData,
      BottomNavigationTabState? bottomNavigationTabState,
        AttendenceObject? attendanceRecords}) {
    return DashboardState(
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      userData: userData ?? this.userData,
      bottomNavigationTabState:
          bottomNavigationTabState ?? this.bottomNavigationTabState,
      attendanceRecords: attendanceRecords ?? this.attendanceRecords,
    );
  }
}
