
import 'package:flutter/material.dart';
import '../screens/onboarding/bloc/onboarding_state.dart';

class OnboardingWidget{
  Widget buildDots({required BuildContext context, required int index, required OnboardingState onboardingState}) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: onboardingState.index == index
              ? const Color(0xFFAC4FC6)
              : const Color(0xFF8194DD),
          shape: BoxShape.circle),
    );
  }
}