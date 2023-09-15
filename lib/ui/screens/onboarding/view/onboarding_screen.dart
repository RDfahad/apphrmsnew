import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';
import '../../../widgets/round_button.dart';
import '../../bottom_navigation/screen/bottom_navigation_screen.dart';
import '../../authentication/view/login_screen.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context,OnboardingState onboardingState){
        if(!onboardingState.  onBoardingStatus){
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
                    onPress: () {
                      context.read<OnboardingCubit>().storeOnboardingStatus();
                    },
                  ),
                  SizedBox(height: context.getScreenHeight * 0.1),
                ],
              ),


            ),
          );
        }
        else if(onboardingState.onBoardingStatus && !onboardingState.isLogIn){
          return LoginScreen();
        }
        else if(onboardingState.onBoardingStatus && onboardingState.isLogIn){
          return BottomNavigationScreen();
        }
        else{
          return Container();
        }
      },

    );
  }
}



