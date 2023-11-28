import 'package:flutter_bloc/flutter_bloc.dart';

import '/utils/configuration.dart';
import '../../../../utils/constants.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.init());

  init() {
    bool onBoardingStatus =
        state.hiveStorage.getData(GlobalConstants.onBoardingStatus) ?? false;
    bool isLoggedIn =
        state.hiveStorage.getData(GlobalConstants.isLogIn) ?? false;
    if (isLoggedIn) {
      Config.isLoggedIn = isLoggedIn;
      emit(
        state.copyWith(isLogIn: isLoggedIn, onBoardingStatus: onBoardingStatus),
      );
    }
    emit(
      state.copyWith(onBoardingStatus: onBoardingStatus),
    );
  }

  storeOnboardingStatus() {
    state.hiveStorage.putData(GlobalConstants.onBoardingStatus, true);
    emit(
      state.copyWith(onBoardingStatus: true),
    );
  }

  onPageChange({int? index}) {
    emit(
      state.copyWith(index: index),
    );
  }
}
