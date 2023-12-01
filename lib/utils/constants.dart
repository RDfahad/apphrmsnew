import 'package:hr_emp_proj/utils/hive_db/hive_db.dart';

final hiveStorage = HiveStorage();

class GlobalConstants {
  static String userDate = 'userdata';
  static String isLogIn = 'isLogIn';
  static String email = 'email';
  static String password = 'password';
  static String onBoardingStatus = 'onBoardingStatus';
  static String isBiometricEnabled = 'isBiometricEnabled';
  static const String none = "NONE";
  static const String faceId = "FACE_ID";
  static const String touchId = "TOUCH_ID";
}
