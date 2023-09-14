import 'package:flutter/material.dart';
import '/domain/entities/authentication_entities/login_user_entity.dart';
import '/utils/hive_db/hive_db.dart';

class OnboardingState {
  final bool isLoading;
  final bool onBoardingStatus;
  final bool isLogIn;
  final int? index;
  final PageController? pageController;
  final UserData? userData;
  final hiveStorage = HiveStorage();

  OnboardingState(
      {required this.isLoading,
      required this.userData,
      required this.index,
      required this.onBoardingStatus,
      required this.isLogIn,
      required this.pageController});

  factory OnboardingState.init() => OnboardingState(
      isLoading: false,
      onBoardingStatus: false,
      isLogIn: false,
      index: 0,
      pageController: PageController(initialPage: 0),
      userData: UserData());

  OnboardingState copyWith(
          {bool? isLoading,
          bool? onBoardingStatus,
          bool? isLogIn,
          int? index,
          PageController? pageController,
          UserData? userData}) =>
      OnboardingState(
          isLoading: isLoading ?? this.isLoading,
          onBoardingStatus: onBoardingStatus ?? this.onBoardingStatus,
          isLogIn: isLogIn ?? this.isLogIn,
          index: index ?? this.index,
          pageController: pageController ?? this.pageController,
          userData: userData ?? this.userData);
}
