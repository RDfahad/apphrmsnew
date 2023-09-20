import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/utils/configuration.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.init());

  init() {
    bool onBoardingStatus = state.hiveStorage.getData("onBoardingStatus") ?? false;
    bool isLoggedIn = state.hiveStorage.getData("isLogIn") ?? false;
    if (isLoggedIn) {
      Config.isLoggedIn = isLoggedIn;
      emit(state.copyWith(
          isLogIn: isLoggedIn, onBoardingStatus: onBoardingStatus));
    }
    emit(state.copyWith(onBoardingStatus: onBoardingStatus));
  }

  storeOnboardingStatus(){
    state.hiveStorage.putData(
        "onBoardingStatus",true);
    emit(state.copyWith(onBoardingStatus: true));
  }

  onPageChange({int? index}){
    emit(state.copyWith(index: index));
  }
}
