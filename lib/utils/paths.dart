Path paths = Path();

enum EnvironmentType { local, live }

class Path {
  Map<String, String> defaultLiveUrl1 = {
    'baseUrl': 'http://192.168.100.38:8083',
    'api_route': 'api/app',
  };

  Map<String, String> defaultLiveUrl = {
    'baseUrl': 'http://hrm.manxel.com',
    'api_route': 'api/app',
  };

  String get customerLogin => '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/login';

  String get refreshToken => '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/refresh_token';

  String get getAttendanceRecord =>
      '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/get_attendance';

  String get editProfileImage => '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/store_dp';

  String get getDocument => '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/get_documents';

  String get forgotPasswordUrl =>
      '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/password/forgot';

  String get getRequestUrl => '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/requests/get';

  String get getRequestDetailUrl =>
      '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/requests/details';

  String get changePasswordUrl =>
      '${defaultLiveUrl['baseUrl']}/${defaultLiveUrl['api_route']}/password/update';
}
