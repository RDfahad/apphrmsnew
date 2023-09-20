

Path paths = Path();

class Path{
  Map<String,String> defaultUrl = {
    'baseUrl' : 'http://192.168.100.38:8083',
    'api_route' : 'api/app',
  };

  String get customerLogin => '${defaultUrl['baseUrl']}/${defaultUrl['api_route']}/login';

  String get refreshToken => '${defaultUrl['baseUrl']}/${defaultUrl['api_route']}/refresh_token';

  String get getAttendanceRecord => '${defaultUrl['baseUrl']}/${defaultUrl['api_route']}/get_attendance';
}