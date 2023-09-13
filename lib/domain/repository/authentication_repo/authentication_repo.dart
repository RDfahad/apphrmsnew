import '../../entities/authentication_entities/login_user_entity.dart';

abstract class AuthenticationRepo {
  // Future<SignUpUser> signUpUser({String? email, String? firstName, String? lastName, String? password});

  Future<LoginUserModel> loginUser({String? email, String? password});
}
