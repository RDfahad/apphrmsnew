import 'dart:convert';

import 'package:hr_emp_proj/domain/entities/profile_entity/profile_entity.dart';
import 'package:hr_emp_proj/domain/repository/profile_repo/profile_repo.dart';

import '../../../domain/entities/authentication_entities/forgot_password_entity.dart';
import '../../../utils/configuration.dart';
import '../../../utils/paths.dart';
import '../../http/http.dart';

class ProfileRepoImpl implements ProfileRepo {
  final HTTPRequest? httpRequest;

  ProfileRepoImpl({required this.httpRequest});

  @override
  Future<ProfileModel> postProfilePicture(String file) async {
    try {
      var body = {"profile_image": file};
      var response =
          await httpRequest?.post(url: paths.editProfileImage, body: body, token: Config.authorization);

      return ProfileModel.fromJson(json.decode(response.content) ?? {});
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<ForgotAndUpdatePasswordModel> changePassword(
      String currentPassword, String newPassword, String confPassword) async {
    try {
      var body = {
        "current_password": currentPassword,
        "password": newPassword,
        'confirm_password': confPassword
      };
      var response =
          await httpRequest?.post(url: paths.changePasswordUrl, body: body, token: Config.authorization);
      return ForgotAndUpdatePasswordModel.fromJson(json.decode(response.content) ?? {});
    } catch (e) {
      return Future.error(e);
    }
  }
}
