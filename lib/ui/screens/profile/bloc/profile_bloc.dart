import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/domain/entities/profile_entity/profile_entity.dart';
import 'package:hr_emp_proj/domain/repository/profile_repo/profile_repo.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '/ui/screens/profile/bloc/profile_state.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/hive_db/hive_db.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit(this.profileRepo) : super(ProfileState.init());

  init() {
    var biometricEnable =
        HiveStorage().getData(GlobalConstants.isBiometricEnabled);
    emit(state.copyWith(touchId: biometricEnable));
  }

  changeTouchId(bool touchId) {
    emit(state.copyWith(touchId: touchId));
  }

  Future getGalleryImage() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedImage != null) {
      log("Waiting for image");

      final imageFile = File(pickedImage.path);

      emit(state.copyWith(isLoading: true, image: imageFile));

      final imageBytes = await imageFile.readAsBytes();
      String base64String =
          "data:image/jpeg;base64,${base64Encode(imageBytes)}";
      ProfileModel res = await profileRepo.postProfilePicture(base64String);
      log("base64String ${res.responseData!.url.toString()}");

      UserData userModel =
          UserData.fromJson(hiveStorage.getModelData(GlobalConstants.userDate));

      final users = User(
        id: userModel.user!.id,
        name: userModel.user!.name,
        email: userModel.user!.email,
        designation: userModel.user!.designation,
        image: res.responseData!.url,
        joiningDate: userModel.user!.joiningDate,
      );
      userModel = UserData(
          user: users, token: userModel.token, tokenType: userModel.tokenType);
      hiveStorage.putModelData(GlobalConstants.userDate, userModel.toJson());

      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}
