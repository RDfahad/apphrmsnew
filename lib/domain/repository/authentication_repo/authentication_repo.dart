

import '../../entities/authentication_entities/login_user_entity.dart';
import '../../entities/authentication_entities/signup_user_entity.dart';

abstract class AuthenticationRepo{
 Future<SignUpUser> signUpUser({String? email, String? firstName, String? lastName, String? password});

 Future<LoginUser> loginUser({String? email, String? password});
}