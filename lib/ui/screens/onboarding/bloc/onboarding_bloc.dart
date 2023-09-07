import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';


class OnboardingCubit extends Cubit<OnboardingState>{
  OnboardingCubit() : super(OnboardingState.init());

  onPageChange({int? index}){
    emit(state.copyWith(index: index));
  }

}