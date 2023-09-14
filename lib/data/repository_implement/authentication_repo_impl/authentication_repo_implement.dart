import 'dart:convert';
import '/utils/configuration.dart';

import '../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../domain/repository/authentication_repo/authentication_repo.dart';
import '../../../utils/paths.dart';
import '../../http/http.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  final HTTPRequest? httpRequest;
  AuthenticationRepoImpl({required this.httpRequest});

  @override
  Future<LoginUserModel> loginUser({String? email, String? password}) async {
    try {
      var body = {"email": email, "password": password};
      var response = await httpRequest?.post(
          url: paths.customerLogin, body: body, token: Config.token);
      return LoginUserModel.fromJson(json.decode(response.content) ?? {});
    } catch (e) {
      return Future.error(e);
    }
  }
}
