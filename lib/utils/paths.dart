

Path paths = Path();

class Path{
  // Consumer key : ck_d3046320b0ce8fb1b4d9dce6cf121c1d63048f40
  // Consumer secret : cs_644666c8b64aedbea471a8748fb0e7dd3f2e620a
  Map<String,String> defaultUrl = {
    'baseUrl' : 'http://192.168.100.38:8083',
    'api_route' : 'api/app',
  };

  String get customerLogin => '${defaultUrl['baseUrl']}/${defaultUrl['api_route']}/login';
}