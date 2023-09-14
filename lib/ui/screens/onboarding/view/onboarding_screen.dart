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
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.06),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_ground.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Enhance your',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const Text(
              'Productivity',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: context.getScreenHeight * 0.02),
            RoundElevatedButton(
              title: "Get Started",
              fontStyle: FontStyle.italic,
              onPress: () {},
            ),
            SizedBox(height: context.getScreenHeight * 0.05),
          ],
        ),
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
