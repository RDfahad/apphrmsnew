

Path paths = Path();

class Path{
  // Consumer key : ck_d3046320b0ce8fb1b4d9dce6cf121c1d63048f40
  // Consumer secret : cs_644666c8b64aedbea471a8748fb0e7dd3f2e620a
  Map<String,String> defaultUrl = {
    'baseUrl' : 'https://clawset.co',
    'jwt_auth' : 'wp-json/jwt-auth',
    'token_endPoint' : '',
    'en_language_module': 'en',
    'wc_api' : 'wp-json/wc/v3',
    'store_api' : 'wp-json/wc/store/v1'
  };

  String get customerLogin => '${defaultUrl['baseUrl']}/${defaultUrl['en_language_module']}/${defaultUrl['jwt_auth']}/v1/token';

  String get customerSignup => '${defaultUrl['baseUrl']}/${defaultUrl['en_language_module']}/${defaultUrl['wc_api']}/customers';

  String get getAllProducts => '${defaultUrl['baseUrl']}/${defaultUrl['en_language_module']}/${defaultUrl['wc_api']}/products';

  String get getCart => '${defaultUrl['baseUrl']}/${defaultUrl['en_language_module']}/${defaultUrl['store_api']}/cart';

  String get addToCart => '${defaultUrl['baseUrl']}/${defaultUrl['en_language_module']}/${defaultUrl['store_api']}/cart/add-item';

  String get removeCart => '${defaultUrl['baseUrl']}/${defaultUrl['en_language_module']}/${defaultUrl['store_api']}/cart/remove-item';

  String get updateCart => '${defaultUrl['baseUrl']}/${defaultUrl['en_language_module']}/${defaultUrl['store_api']}/cart/update-item';

}