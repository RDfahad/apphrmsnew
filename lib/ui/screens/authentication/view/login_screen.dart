import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/ui/screens/bottom_navigation/screen/bottom_navigation_screen.dart';
import '/utils/constants.dart';
import '/utils/hive_db/hive_db.dart';
import '/ui/screens/authentication/bloc/authentication_bloc.dart';
import '/ui/screens/authentication/bloc/authentication_state.dart';
import '/ui/widgets/custom_text_field.dart';
import '/ui/widgets/loader_widget.dart';
import '/ui/widgets/round_button.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ValueNotifier<bool> passScene = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: BlocConsumer(
        bloc: BlocProvider.of<AuthenticationCubit>(context)..init(),
        listener: (context, AuthenticationState state) {
          if (state.loginSuccessfull) {
            print('done');
            Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (_) => const BottomNavigationScreen()));
          }
        },
        builder: (context, AuthenticationState state) {
          return CustomLoaderWidget(
            isLoading: state.loginLoading,
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
                          image:
                              const AssetImage('assets/images/back_ground.png'),
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
                          state.error
                              ? Expanded(
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
                                )
                              : Container(),
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
                              context.read<AuthenticationCubit>().loginUser(
                                    email: state.emailController.text,
                                    password: state.passwordController.text,
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
          );
        },
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final ValueNotifier<bool> passScene = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: BlocProvider.of<AuthenticationCubit>(context)..init(),
        listener: (context, AuthenticationState state) {
          if (state.loginSuccessfull) {
            context.read<AuthenticationCubit>().removeError();
            Navigator.of(context).pushAndRemoveUntil(
                CupertinoPageRoute(
                    builder: (context) => const BottomNavigationScreen()),
                (Route<dynamic> route) => false);
          }
        },
        builder: (context, AuthenticationState state) {
          return Scaffold(
            backgroundColor: AppColor.appBackgroundColor,
            body: CustomLoaderWidget(
              isLoading: state.loginLoading,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: context.getScreenWidth * 0.04),
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
                                "Sign in with Email",
                                style: TextStyle(
                                    color: AppColor.primaryTextWhiteColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Input your manxel account!",
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
                          controller: state.emailController,
                          hintText: "Email",
                          onChange: (val) {
                            context
                                .read<AuthenticationCubit>()
                                .checkButtonEnabledDisabled();
                          },
                        ),
                        SizedBox(height: context.getScreenHeight * 0.02),
                        const Text(
                          "Password",
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: context.getScreenHeight * 0.01),
                        CustomPasswordTextField1(
                          controller: state.passwordController,
                          hintText: "Password",
                          obsecurePassword: passScene,
                          onChange: (val) {
                            context
                                .read<AuthenticationCubit>()
                                .checkButtonEnabledDisabled();
                          },
                        ),
                        SizedBox(height: context.getScreenHeight * 0.01),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(
                                  color: AppColor.primaryButtonColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        state.error
                            ? Center(
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
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  state.isBiometricEnable
                      ? Center(
                          child: InkWell(
                            onTap: () async {
                              await state.localAuthenticationService
                                  .authenticate()
                                  .then((value) {
                                if (value) {
                                  context.read<AuthenticationCubit>().loginUser(
                                      email: HiveStorage()
                                          .getData(GlobalConstants.email),
                                      password: HiveStorage()
                                          .getData(GlobalConstants.password),
                                      isBiometric: true);
                                }
                              });
                            },
                            child: state.biometricType ==
                                    GlobalConstants.touchId
                                ? const Icon(
                                    Icons.fingerprint,
                                    size: 60,
                                  )
                                : state.biometricType == GlobalConstants.faceId
                                    ? Image.asset('assets/images/face-id.png',
                                        width: context.getScreenWidth * 0.2,
                                        height: context.getScreenHeight * 0.1,
                                        fit: BoxFit.fill)
                                    : Container(),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundElevatedButton(
                    height: context.getScreenHeight * 0.07,
                    title: "Sign in Now",
                    buttonColor: AppColor.secondaryButtonColor,
                    width: double.infinity,
                    borderRadius: 0,
                    onPress: state.isButtonEnabled
                        ? () {
                            context.read<AuthenticationCubit>().loginUser(
                                  email: state.emailController.text,
                                  password: state.passwordController.text,
                                );
                          }
                        : null,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
