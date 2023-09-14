import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/ui/screens/dashboard/view/dashboard_screen.dart';
import '/utils/extension_methods.dart';
import '../../../widgets/oboarding_widget.dart';
import '../../authentication/view/login_screen.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<OnboardingCubit>(context),
        builder: (context, OnboardingState onboardingState) {
          if (onboardingState.onBoardingStatus && onboardingState.userData!.token!.isEmpty) {
            return LoginScreen();
          } else if (onboardingState.userData!.token!.isNotEmpty && onboardingState.onBoardingStatus) {
            return DashBoardScreen();
          }
          return Stack(
            children: [
              Center(
                  child: PageView.builder(
                      onPageChanged: (int index) {
                        context
                            .read<OnboardingCubit>()
                            .onPageChange(index: index);
                      },
                      controller: onboardingState.pageController,
                      itemCount: 3,
                      itemBuilder: (_, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.getScreenWidth * 0.02),
                          child: Column(
                            children: [
                              Image.asset(
                                contents[i].image,
                                width: context.getScreenWidth * 0.8,
                                height: context.getScreenHeight * 0.5,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                'Pedigree for Pets',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: context.getMainColor),
                              ),
                              Text(
                                contents[i].text,
                                style: const TextStyle(color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      })),
              Container(
                padding:
                    EdgeInsets.only(bottom: context.getScreenHeight * 0.03),
                width: context.getScreenWidth,
                height: context.getScreenHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.getScreenHeight * 0.1, bottom: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (index) => OnboardingWidget().buildDots(
                                  context: context,
                                  index: index,
                                  onboardingState:
                                      onboardingState)) //buildDots(context: context, index: index,onboardingState: onboardingState)),
                          ),
                    ),
                    SizedBox(
                      width: context.getScreenWidth * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          onboardingState.hiveStorage
                              .putData("onboardingstatus", true);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.getMainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the radius as needed
                          ),
                        ),
                        child: Text(
                          onboardingState.index == contents.length - 1
                              ? 'Get Started'
                              : 'Skip',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
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
          "First Pet pedigree is a record of an animal's ancestry, showcasing its lineage and genetic history."
          "It helps trace and document generations of a particular breed, aiding in maintaining desired traits and health."
          "Pedigrees assist breeders in making informed decisions for responsible breeding practices.",
      image: 'assets/images/logo.png'),
  OnboardingContent(
      text:
          "Second Pet pedigree is a record of an animal's ancestry, showcasing its lineage and genetic history."
          "It helps trace and document generations of a particular breed, aiding in maintaining desired traits and health."
          "Pedigrees assist breeders in making informed decisions for responsible breeding practices.",
      image: 'assets/images/logo.png'),
  OnboardingContent(
      text:
          "Third Pet pedigree is a record of an animal's ancestry, showcasing its lineage and genetic history."
          "It helps trace and document generations of a particular breed, aiding in maintaining desired traits and health."
          "Pedigrees assist breeders in making informed decisions for responsible breeding practices.",
      image: 'assets/images/logo.png'),
];
