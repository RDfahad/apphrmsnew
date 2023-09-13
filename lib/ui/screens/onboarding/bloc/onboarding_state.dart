import 'package:flutter/material.dart';
import 'package:hr_emp_proj/domain/entities/authentication_entities/login_user_entity.dart';
import 'package:hr_emp_proj/utils/hive_db/hive_db.dart';

class OnboardingState {
  final bool isLoading;
  final bool onBoardingStatus;
  final int? index;
  final PageController? pageController;
  final UserData? userData;
  final hiveStorage = HiveStorage();

  OnboardingState(
      {required this.isLoading,
      required this.userData,
      required this.index,
      required this.onBoardingStatus,
      required this.pageController});

  factory OnboardingState.init() => OnboardingState(
      isLoading: false,
      onBoardingStatus: false,
      index: 0,
      pageController: PageController(initialPage: 0),
      userData: UserData());

  OnboardingState copyWith(
          {bool? isLoading,
          bool? onBoardingStatus,
          int? index,
          PageController? pageController,
          UserData? userData}) =>
      OnboardingState(
          isLoading: isLoading ?? this.isLoading,
          onBoardingStatus: onBoardingStatus ?? this.onBoardingStatus,
          index: index ?? this.index,
          pageController: pageController ?? this.pageController,
          userData: userData ?? this.userData);
}
