import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.init());

  init() {
    emit(state);
    // var userModel = state.hiveStorage.getData("userdata");
    // var userData = userModel != null ? UserData.fromJson(jsonDecode(userModel ?? '')) : null;
    bool onBoardingStatus = state.hiveStorage.getData("onBoardingStatus") ?? false;
    bool islogIn = state.hiveStorage.getData("isLogIn") ?? false;
    if (islogIn) {
      emit(state.copyWith(
          isLogIn: islogIn, onBoardingStatus: onBoardingStatus));
    }
    emit(state.copyWith(onBoardingStatus: onBoardingStatus));
  }

  onPageChange({int? index}) {
    emit(state.copyWith(index: index));
  }

  storeOnboardingStatus(){
    state.hiveStorage.putData(
        "onBoardingStatus",true);
    emit(state.copyWith(onBoardingStatus: true));
  }
}
