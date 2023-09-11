import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/authentication/bloc/authentication_bloc.dart';
import 'package:hr_emp_proj/ui/screens/authentication/bloc/authentication_state.dart';
import 'package:hr_emp_proj/ui/screens/authentication/cubit/login_cubit.dart';
import 'package:hr_emp_proj/ui/screens/authentication/cubit/login_state.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/view/dashboard_screen.dart';
import 'package:hr_emp_proj/ui/widgets/round_button.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/custom_text_field.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: "hamzab@gmail.com");
  TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: context.getScreenWidth * 0.03),
                height: context.getScreenHeight * 0.18,
                width: double.infinity,
                color: AppColor.loginAppBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.getScreenHeight * 0.04),
                    Image.asset("assets/icons/login_icon.png"),
                    SizedBox(height: context.getScreenHeight * 0.015),
                    const Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: context.getScreenHeight * 0.06),
            Flexible(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * 0.02),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        preffixIcon: Icons.email,
                        controller: emailController,
                        labelText: "Email",
                        hintText: "Email",
                        borderRadius: 25,
                        onChange: (value) {},
                      ),
                      SizedBox(height: context.getScreenHeight * 0.02),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: context.getScreenWidth * 0.02),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 16,
                                color: AppColor.secondaryButtonColor,
                                blurRadius: 16),
                          ],
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: _obsecurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              style: TextStyle(color: AppColor.blackColor),
                              obscureText: _obsecurePassword.value,
                              obscuringCharacter: "*",
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                  color: AppColor.blackColor,
                                ),
                                hintText: "password",
                                hintStyle: const TextStyle(
                                  color: AppColor.blackColor,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColor.secondaryTextColor,
                                ),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      _obsecurePassword.value =
                                          !_obsecurePassword.value;
                                    },
                                    child: Icon(
                                      _obsecurePassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility,
                                      size: 25,
                                      color: AppColor.secondaryTextColor,
                                    )),
                              ),
                              onChanged: (value) {
                                context.read<AuthenticationCubit>().loginUser(
                                    email: emailController.text,
                                    password: passwordController.text);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: context.getScreenHeight * 0.02),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      // Expanded(child: SizedBox()),
                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          if (state.errorMessage != null) {
                            return Center(
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.warning_amber,
                                    size: 30,
                                    color: AppColor.redColor,
                                  ),
                                  SizedBox(
                                      height: context.getScreenHeight * 0.01),
                                  Center(
                                    child: Text(
                                      state.errorMessage.toString(),
                                      //    "There are something wrong with your login\n credentials, please double check and try again.",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.redColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      SizedBox(height: context.getScreenHeight * 0.04),
                    ],
                  ),
                )),
            Flexible(
              flex: 1,
              child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.getScreenWidth * 0.04),
                    child: RoundButton(
                      title: "Sign In",
                      onPress: () {
                        context.read<AuthenticationCubit>().loginUser(
                              email: 'user@gmail.com',
                              password: '12345678',
                            );
                      },
                      width: double.infinity,
                      borderRadius: 25,
                      buttonColor: (state.isValid)
                          ? AppColor.primaryButtonColor
                          : AppColor.secondaryButtonColor,
                      textColor: (state.isValid)
                          ? AppColor.whiteColor
                          : AppColor.secondaryTextColor,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
