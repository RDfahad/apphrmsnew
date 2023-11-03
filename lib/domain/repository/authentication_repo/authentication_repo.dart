import 'package:hr_emp_proj/domain/entities/authentication_entities/forgot_password_entity.dart';

import '../../entities/authentication_entities/login_user_entity.dart';
import '../../entities/authentication_entities/refresh_token.dart';

abstract class AuthenticationRepo {

  Future<LoginUserModel> loginUser({String? email, String? password});
  Future<ForgotPasswordModel> forgotPassword({String? email});

  Future<RefreshToken> refreshToken();
}
