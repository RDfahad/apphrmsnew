import 'package:flutter/material.dart';

class OnboardingState{
  final bool isLoading;
  final int? index;
  final PageController? pageController;
  const OnboardingState({required this.isLoading,required this.index, required this.pageController});

  factory OnboardingState.init() => OnboardingState(isLoading: false, index: 0,pageController: PageController(initialPage: 0));

  OnboardingState copyWith({bool? isLoading,int? index,PageController? pageController }) => OnboardingState(
      isLoading: isLoading ?? this.isLoading,
      index: index ?? this.index,
      pageController: pageController ?? this.pageController
  );

}