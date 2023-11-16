import 'package:hr_emp_proj/domain/entities/profile_entity/profile_entity.dart';

import '../../entities/authentication_entities/forgot_password_entity.dart';

abstract class ProfileRepo {
  Future<ProfileModel> postProfilePicture(String file);
   Future<ForgotAndUpdatePasswordModel> changePassword(String currentPassword,String newPassword,String confPassword);
}
