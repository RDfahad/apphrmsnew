import 'dart:convert';
import '../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../domain/entities/authentication_entities/signup_user_entity.dart';
import '../../../domain/repository/authentication_repo/authentication_repo.dart';
import '../../../utils/configuration.dart';
import '../../../utils/paths.dart';
import '../../http/http.dart';

class AuthenticationRepoImpl implements AuthenticationRepo{
  final HTTPRequest? httpRequest;
  AuthenticationRepoImpl({required this.httpRequest});
 
  @override
  Future<SignUpUser> signUpUser({String? email, String? firstName, String? lastName, String? password}) async {
    try{
      String authToken = base64.encode(utf8.encode('${Config.key}:${Config.secret}'));
     var body = {
                "email":email,
                "first_name": firstName,
                "last_name": lastName,
                "password": password,
                "username": email,
              };
      var response = await httpRequest?.post(url: paths.customerSignup,body: body,token: 'Basic $authToken');
      return SignUpUser.fromJson(json.decode(response.content) ?? {});
    }catch(e){
      return Future.error(e);
    }
  }

  @override
  Future<LoginUser> loginUser({String? email, String? password}) async {
    try{
      var body = {
        "username": email,
        "password": password
      };
      var response = await httpRequest?.post(url: paths.customerLogin,body: body);
      return LoginUser.fromJson(json.decode(response.content) ?? {});
    }catch(e){
      return Future.error(e);
    }
  }

}