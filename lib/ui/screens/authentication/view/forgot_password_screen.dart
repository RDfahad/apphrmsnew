import 'package:flutter/material.dart';
import '/ui/widgets/custom_text_field.dart';
import '/ui/widgets/round_button.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * 0.02),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF0b84c8),
                          Color(0xff214cbd),
                          Color(0xff214cbd),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  height: context.getScreenHeight * 0.2,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: AppColor.primaryTextWhiteColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Enter your email to recover  ",
                        style: TextStyle(
                            color: AppColor.primaryTextWhiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.getScreenHeight * 0.05),
                const Text(
                  "Email",
                  style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: context.getScreenHeight * 0.01),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: "Email",
                  onChange: (val) {},
                ),
                SizedBox(height: context.getScreenHeight * 0.01),
              ],
            ),
          ),
          Spacer(),
          RoundElevatedButton(
            title: "Reset Password",
            buttonColor: AppColor.secondaryButtonColor,
            width: double.infinity,
            borderRadius: 04,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
