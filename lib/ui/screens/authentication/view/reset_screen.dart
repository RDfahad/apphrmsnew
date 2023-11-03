import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_emp_proj/ui/screens/authentication/view/login_screen.dart';
import '/ui/widgets/custom_text_field.dart';
import '/ui/widgets/round_button.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
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
                        "Recovery",
                        style: TextStyle(
                            color: AppColor.primaryTextWhiteColor, fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Password Reset",
                        style: TextStyle(
                            color: AppColor.primaryTextWhiteColor, fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.getScreenHeight * 0.05),
                SizedBox(height: context.getScreenHeight * 0.01),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Reset Link Has Been Sent.",
                      style: TextStyle(
                          color: AppColor.primaryTextBlackColor, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Check your inbox/spam folder",
                      style: TextStyle(
                          color: AppColor.primaryTextBlackColor, fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(height: context.getScreenHeight * 0.01),
              ],
            ),
          ),
          const Spacer(),
          RoundElevatedButton(
            title: "Login Now",
            buttonColor: AppColor.secondaryButtonColor,
            width: double.infinity,
            borderRadius: 04,
            onPress: () {
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => SignInScreen()));
            },
          ),
        ],
      ),
    );
  }
}
