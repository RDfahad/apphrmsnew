import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/screens/bottom_navigation/screen/bottom_navigation_screen.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';
import '../../../widgets/oboarding_widget.dart';
import '../../authentication/view/login_screen.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<OnboardingCubit>(context),
      builder: (context, OnboardingState onboardingState) {
        // print(!onboardingState.onBoardingStatus);
        if (!onboardingState.onBoardingStatus) {
          return Scaffold(
            backgroundColor: const Color(0xFF1c1e23),
            body: Stack(
              children: [
                PageView.builder(
                    onPageChanged: (int index) {
                      context
                          .read<OnboardingCubit>()
                          .onPageChange(index: index);
                    },
                    controller: onboardingState.pageController,
                    itemCount: 3,
                    itemBuilder: (_, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.getScreenWidth,
                            height: context.getScreenHeight * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: Colors.white,
                                  width: context.getScreenWidth * 0.25,
                                  child: Image.asset(
                                    'assets/images/manxel-logo.png',
                                    width: context.getScreenWidth * 0.8,
                                    height: context.getScreenHeight * 0.5,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: context.getScreenWidth * 0.65,
                                  child: Image.asset(
                                    contents[i].image,
                                    width: context.getScreenWidth * 0.8,
                                    height: context.getScreenHeight * 0.5,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding:
                        EdgeInsets.only(bottom: context.getScreenHeight * 0.03),
                    width: context.getScreenWidth,
                    height: context.getScreenHeight * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.getScreenWidth * 0.05,
                              vertical: context.getScreenHeight * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  children: List.generate(
                                      3,
                                      (index) => OnboardingWidget().buildDots(
                                          context: context,
                                          index: index,
                                          onboardingState: onboardingState))),
                              SizedBox(
                                height: context.getScreenHeight * 0.04,
                              ),
                              const Text(
                                'Let’s simplify your HR using our platform !',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.whiteColor),
                              ),
                              SizedBox(
                                height: context.getScreenHeight * 0.02,
                              ),
                              Text(
                                contents[onboardingState.index!].text,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const Text(
                                'Get Started',
                                style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          child: SizedBox(
                            width: context.getScreenWidth * 0.8,
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<OnboardingCubit>()
                                    .storeOnboardingStatus();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Adjust the radius as needed
                                ),
                              ),
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (onboardingState.onBoardingStatus &&
            !onboardingState.isLogIn) {
          return SignInScreen();
        } else if (onboardingState.onBoardingStatus &&
            onboardingState.isLogIn) {
          return const BottomNavigationScreen();
        } else {
          return Container();
        }
      },
    );
  }
}

class OnboardingContent {
  String text;
  String image;

  OnboardingContent({required this.text, required this.image});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      text:
          "Unlock the Power of People with Manxel: Your HRMS Solution for a Brighter Workplace!.",
      image: 'assets/images/onboarding1.png'),
  OnboardingContent(
      text:
          "Unlock the Power of People with Manxel: Your HRMS Solution for a Brighter Workplace!.",
      image: 'assets/images/onboarding2.png'),
  OnboardingContent(
    text:
        "Unlock the Power of People with Manxel: Your HRMS Solution for a Brighter Workplace!.",
    image: 'assets/images/onboarding3.png',
  ),
];
