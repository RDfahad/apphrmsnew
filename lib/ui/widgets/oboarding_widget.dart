import 'package:flutter/material.dart';
import '/utils/extension_methods.dart';
import '../screens/onboarding/bloc/onboarding_state.dart';

class OnboardingWidget {
  Widget buildDots(
      {required BuildContext context,
      required int index,
      required OnboardingState onboardingState}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.01),
      margin: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.01),
      height: 3,
      width: context.getScreenWidth * 0.28,
      color: onboardingState.index == index ? Colors.white : Colors.grey,
    );
  }
}
