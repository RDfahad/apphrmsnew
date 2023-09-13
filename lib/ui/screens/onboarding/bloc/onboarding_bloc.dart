import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/domain/entities/authentication_entities/login_user_entity.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.init());

  init() {
    var userModel = state.hiveStorage.getData("userdata");
    var userData = UserData.fromJson(jsonDecode(userModel ?? ''));
    bool onBoardingStatus = state.hiveStorage.getData("onboardingstatus");
    if (userData.token?.isNotEmpty ?? false) {
      emit(state.copyWith(
          userData: userData, onBoardingStatus: onBoardingStatus));
    }
    emit(state);
  }

  onPageChange({int? index}) {
    emit(state.copyWith(index: index));
  }
}
