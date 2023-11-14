import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class MoodDetectionScreen extends StatelessWidget {
  const MoodDetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.04)
            .copyWith(bottom: context.getScreenHeight * 0.02),
        padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.06)
            .copyWith(bottom: context.getScreenHeight * 0.02),
        height: context.getScreenHeight * 1,
        width: context.getScreenWidth * 1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0b84c8),
              Color(0xff214cbd),
              Color(0xFF0b84c8),
              Color(0xff214cbd),
              Color(0xFF0b84c8),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: context.getScreenHeight * 0.2),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/icons/happy_emoji.png',
                height: context.getScreenHeight * 0.11,
              ),
            ),
            Text(
              'You are Happy \nToday!',
              style: context.getFontText.headlineSmall!.copyWith(color: AppColor.whiteColor),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Continue to Manxel',
                style: context.getFontText.titleMedium!
                    .copyWith(color: AppColor.whiteColor, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: context.getScreenHeight * 0.001),
          ],
        ),
      ),
    );
  }
}
