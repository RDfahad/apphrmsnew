import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/bottom_navigation/screen/bottom_navigation_screen.dart';
import '/ui/screens/authentication/bloc/authentication_bloc.dart';
import '/ui/screens/authentication/bloc/authentication_state.dart';
import '/ui/widgets/custom_text_field.dart';
import '/ui/widgets/loader_widget.dart';
import '/ui/widgets/round_button.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> passScene = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state.loginSuccessfull) {
            print('done');
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) => BottomNavigationScreen()));
          }
        },
        builder: (context, state) {
          return CustomLoaderWidget(
            isLoading: state.loginLoading,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.getScreenWidth * 0.06),
                      height: context.getScreenHeight * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/back_ground.png'),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(
                                AppColor.primaryColor.withOpacity(0.5),
                                BlendMode.lighten)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: context.getScreenHeight * 0.04),
                          Image.asset("assets/icons/login_icon_white.png"),
                          SizedBox(height: context.getScreenHeight * 0.015),
                          const Text(
                            "Sign In",
                            style: TextStyle(
                                color: AppColor.primaryTextWhiteColor,
                                fontSize: 34,
                                fontWeight: FontWeight.w500),
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
                            horizontal: context.getScreenWidth * 0.03),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              prefixIcon: Icons.email,
                              isIconColorChange: state.isIconFieldColorEnabled,
                              controller: state.emailController,
                              labelText: "Email",
                              hintText: "Email",
                              borderRadius: 25,
                              onChange: (value) {
                                context
                                    .read<AuthenticationCubit>()
                                    .checkButtonEnabledDisabled();
                              },
                            ),
                            SizedBox(height: context.getScreenHeight * 0.02),
                            CustomPasswordTextField(
                              isIconColorChange: state.isIconFieldColorEnabled,
                              obsecurePassword: passScene,
                              controller: state.passwordController,
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
                            state.error ? Expanded(
                              child: Center(
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.warning_amber,
                                      size: 30,
                                      color: AppColor.redColor,
                                    ),
                                    SizedBox(
                                        height:
                                        context.getScreenHeight * 0.01),
                                    Center(
                                      child: Text(
                                        state.errorMessage.toString(),
                                        //"There are something wrong with your login\n credentials, please double check and try again.",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: AppColor.redColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ) : Container(),
                            SizedBox(height: context.getScreenHeight * 0.04),
                          ],
                        ),
                      )),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.getScreenWidth * 0.04),
                      child: RoundElevatedButton(
                        title: "Sign In",
                        onPress: state.isButtonEnabled
                            ? () {
                          context
                              .read<AuthenticationCubit>()
                              .loginUser(
                            email: state.emailController.text,
                            password:
                            state.passwordController.text,
                          );
                        }
                            : null,
                        width: double.infinity,
                        borderRadius: 25,
                        height: context.getScreenHeight * 0.06,
                        buttonColor: (state.isButtonEnabled)
                            ? AppColor.primaryButtonColor
                            : AppColor.secondaryButtonColor,
                        textColor: (state.isButtonEnabled)
                            ? AppColor.whiteColor
                            : AppColor.secondaryTextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
