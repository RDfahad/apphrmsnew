import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/round_button.dart';
import '/ui/screens/authentication/bloc/authentication_bloc.dart';
import '/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import '/ui/screens/profile/bloc/profile_bloc.dart';
import '/ui/screens/profile/bloc/profile_state.dart';
import '/utils/extension_methods.dart';
import '../../../../utils/app_color.dart';

class ChangedPasswordScreen extends StatelessWidget {
  ChangedPasswordScreen({super.key});
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        body: BlocBuilder(
          bloc: BlocProvider.of<ProfileCubit>(context)..init(),
          builder: (context, ProfileState state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.getScreenWidth,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: context.getScreenWidth * 0.05,
                                vertical: context.getScreenHeight * 0.05),
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
                            width: context.getScreenWidth,
                            child: Text(
                              "Change\nPassword",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  color: AppColor.primaryTextWhiteColor,
                                  fontSize: context.getFontText.headlineSmall!.fontSize,
                                  height: 1),
                            ),
                          ),
                          Positioned(
                            top: context.getScreenHeight * 0.1,
                            right: context.getScreenHeight * 0.03,
                            child: GestureDetector(
                              onTap: () {
                                // Handle the circular image tap here
                                log("Circular image tapped ${state.image}");
                                context.read<ProfileCubit>().getGalleryImage();
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  state.image != null
                                      ? Container(
                                          height: context.getScreenHeight * 0.15,
                                          width: context.getScreenHeight * 0.15,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xFFd9d9d9),
                                            border: Border.all(
                                              color: AppColor.whiteColor,
                                              width: 3,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 3,
                                                color: Colors.grey.shade200,
                                                blurRadius: 2,
                                              ),
                                            ],
                                            image: DecorationImage(
                                              image: FileImage(state.image!.absolute),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : CachedNetworkImage(
                                          height: context.getScreenHeight * 0.15,
                                          width: context.getScreenHeight * 0.15,
                                          imageUrl:
                                              context.read<DashboardCubit>().state.userData.user?.image ?? '',
                                          imageBuilder: (context, imageProvider) => Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: const Color(0xFFd9d9d9),
                                              border: Border.all(
                                                color: AppColor.whiteColor,
                                                width: 3,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 3,
                                                  color: Colors.grey.shade200,
                                                  blurRadius: 2,
                                                ),
                                              ],
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => SizedBox(
                                            height: context.getScreenHeight * 0.08,
                                            width: context.getScreenHeight * 0.08,
                                            child: const CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                        ),
                                  Positioned(
                                    top: context.getScreenHeight * 0.1,
                                    left: context.getScreenHeight * 0.1,
                                    height: context.getScreenHeight * 0.05,
                                    width: context.getScreenHeight * 0.05,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.primaryColor,
                                        border: Border.all(
                                          color: AppColor.whiteColor,
                                          width: 3,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 3,
                                            color: Colors.grey.shade200,
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: context.getScreenHeight * 0.02,
                        left: context.getScreenWidth * 0.04,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: context.getScreenWidth * 0.6,
                              child: Text(
                                context.read<DashboardCubit>().state.userData.user?.name ?? '',
                                style: const TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 01.1,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            context.read<DashboardCubit>().state.userData.user?.designation ?? '',
                            style: const TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 14,
                                height: 0.4,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.getScreenHeight * 0.02),
                    SizedBox(height: context.getScreenHeight * 0.05),
                    const Text(
                      "Current Password",
                      style: TextStyle(color: AppColor.blackColor, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: context.getScreenHeight * 0.01),
                    CustomTextField(
                      controller: currentPasswordController,
                      hintText: "***************",
                      onChange: (val) {},
                    ),
                    SizedBox(height: context.getScreenHeight * 0.02),
                    const Text(
                      "New Password",
                      style: TextStyle(color: AppColor.blackColor, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: context.getScreenHeight * 0.01),
                    CustomTextField(
                      controller: newPasswordController,
                      hintText: "***************",
                      onChange: (val) {},
                    ),
                    SizedBox(height: context.getScreenHeight * 0.02),
                    const Text(
                      "Confirm  Password",
                      style: TextStyle(color: AppColor.blackColor, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: context.getScreenHeight * 0.01),
                    CustomTextField(
                      controller: confPasswordController,
                      hintText: "***************",
                      onChange: (val) {},
                    ),
                    SizedBox(height: context.getScreenHeight * 0.03),
                    RoundElevatedButton(
                      height: context.getScreenHeight * 0.07,
                      title: "Change Password",
                      buttonColor: AppColor.secondaryButtonColor,
                      width: double.infinity,
                      borderRadius: 0,
                      onPress: () {
                        if (currentPasswordController.text.isNotEmpty &&
                            newPasswordController.text.isNotEmpty &&
                            confPasswordController.text.isNotEmpty) {
                          context.read<ProfileCubit>().changedPassword(
                                currentPasswordController.text,
                                newPasswordController.text,
                                confPasswordController.text,
                              );
                        } else {
                          log("Fill all the fields");
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
