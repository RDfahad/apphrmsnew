import 'package:hr_emp_proj/domain/entities/profile_entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<ProfileModel> postProfilePicture(String file);
}
