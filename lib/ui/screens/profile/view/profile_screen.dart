import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/profile/view/change_password.dart';
import 'package:hr_emp_proj/utils/helper.dart';
import '/ui/screens/authentication/bloc/authentication_bloc.dart';
import '/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import '/ui/screens/dashboard/bloc/dashboard_state.dart';
import '/ui/screens/profile/bloc/profile_bloc.dart';
import '/ui/screens/profile/bloc/profile_state.dart';
import '/utils/extension_methods.dart';
import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/configuration.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/hive_db/hive_db.dart';
import '../../attendance/cubit/attendance_cubit.dart';
import '../../authentication/view/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                            child: const Text(
                              "Edit\nProfile",
                              style:
                                  TextStyle(color: AppColor.primaryTextWhiteColor, fontSize: 28, height: 1),
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
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
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
                                      child: Icon(
                                        Icons.edit,
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Positioned(
                          //   top: context.getScreenHeight * 0.1,
                          //   right: context.getScreenHeight * 0.03,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       log("Circular image tapped ${state.image}");
                          //       context.read<ProfileCubit>().getGalleryImage();
                          //     },
                          //     child: Stack(
                          //       clipBehavior: Clip.none,
                          //       children: [
                          //         CachedNetworkImage(
                          //           height: context.getScreenHeight * 0.15,
                          //           width: context.getScreenHeight * 0.15,
                          //           imageUrl: context
                          //                   .read<DashboardCubit>()
                          //                   .state
                          //                   .userData
                          //                   .user
                          //                   ?.image ??
                          //               '',
                          //           imageBuilder: (context, imageProvider) =>
                          //               Container(
                          //             decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               color: const Color(0xFFd9d9d9),
                          //               border: Border.all(
                          //                 color: AppColor.whiteColor,
                          //                 width: 3,
                          //               ),
                          //               boxShadow: [
                          //                 BoxShadow(
                          //                   spreadRadius: 3,
                          //                   color: Colors.grey.shade200,
                          //                   blurRadius: 2,
                          //                 ),
                          //               ],
                          //               image: DecorationImage(
                          //                 image: imageProvider,
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             ),
                          //           ),
                          //           placeholder: (context, url) => Container(
                          //               height: context.getScreenHeight * 0.08,
                          //               width: context.getScreenHeight * 0.08,
                          //               child: CircularProgressIndicator()),
                          //           errorWidget: (context, url, error) => Icon(Icons
                          //               .error), // You can use any error widget here
                          //         ),
                          //         Positioned(
                          //           top: context.getScreenHeight * 0.1,
                          //           left: context.getScreenHeight * 0.1,
                          //           height: context.getScreenHeight * 0.05,
                          //           width: context.getScreenHeight * 0.05,
                          //           child: Container(
                          //             decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               color: AppColor.primaryColor,
                          //               border: Border.all(
                          //                 color: AppColor.whiteColor,
                          //                 width: 3,
                          //               ),
                          //               boxShadow: [
                          //                 BoxShadow(
                          //                   spreadRadius: 3,
                          //                   color: Colors.grey.shade200,
                          //                   blurRadius: 2,
                          //                 ),
                          //               ],
                          //             ),
                          //             child: const Center(
                          //               child: Icon(
                          //                 Icons.edit,
                          //                 color: AppColor.whiteColor,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
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
                    Container(
                      width: context.getScreenWidth * 0.9,
                      margin: EdgeInsets.only(top: context.getScreenHeight * 0.07),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 10,
                            color: Colors.grey.shade100,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              nextScreen(context, ChangedPasswordScreen());
                            },
                            title: const Text(
                              'Change Password',
                              style: TextStyle(color: AppColor.blackColor),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.grey.shade500,
                            ),
                            leading: const Icon(
                              Icons.lock_open,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),
                            child: const Divider(
                              height: 1,
                              thickness: 0.3,
                              color: AppColor.secondaryTextColor,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              HiveStorage().putData(GlobalConstants.userDate,
                                  jsonEncode(UserData(user: User(), token: "", tokenType: "").toJson()));
                              HiveStorage().putData(GlobalConstants.isLogIn, false);
                              Config.isLoggedIn = false;
                              Config.authorization = '';
                              // context.read<DashboardCubit>().changeTab(BottomNavigationTabState.homeScreen);
                              // context.read<DashboardCubit>().initState();

                              Navigator.of(context).pushAndRemoveUntil(
                                  CupertinoPageRoute(builder: (context) => SignInScreen()),
                                  (Route<dynamic> route) => false);
                              context.read<ProfileCubit>().resetAllCubitStates(context);
                            },
                            title: const Text(
                              'Logout',
                              style: TextStyle(color: AppColor.blackColor),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.grey.shade500,
                            ),
                            leading: Transform.flip(
                                flipX: true,
                                child: const Icon(
                                  Icons.logout,
                                  color: AppColor.primaryColor,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: context.getScreenWidth * 0.9,
                      margin: EdgeInsets.only(top: context.getScreenHeight * 0.07),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 10,
                            color: Colors.grey.shade100,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'Request Notifications',
                              style: TextStyle(color: AppColor.blackColor),
                            ),
                            trailing: Switch(
                              activeColor: AppColor.whiteColor,
                              focusColor: AppColor.blackColor,
                              activeTrackColor: AppColor.primaryColor,
                              inactiveThumbColor: AppColor.whiteColor,
                              inactiveTrackColor: Colors.grey.shade400,
                              value: false,
                              trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              onChanged: (bool value) {},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),
                            child: const Divider(
                              height: 1,
                              thickness: 0.3,
                              color: AppColor.secondaryTextColor,
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Announcement Notifications',
                              style: TextStyle(color: AppColor.blackColor),
                            ),
                            trailing: Switch(
                              activeColor: AppColor.whiteColor,
                              focusColor: AppColor.blackColor,
                              activeTrackColor: AppColor.primaryColor,
                              inactiveThumbColor: AppColor.whiteColor,
                              inactiveTrackColor: Colors.grey.shade400,
                              value: true,
                              trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              onChanged: (bool value) {},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),
                            child: const Divider(
                              height: 1,
                              thickness: 0.3,
                              color: AppColor.secondaryTextColor,
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Touch ID',
                              style: TextStyle(color: AppColor.blackColor),
                            ),
                            trailing: Switch(
                              activeColor: AppColor.whiteColor,
                              focusColor: AppColor.blackColor,
                              activeTrackColor: AppColor.primaryColor,
                              inactiveThumbColor: AppColor.whiteColor,
                              inactiveTrackColor: Colors.grey.shade400,
                              value: state.touchId,
                              trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              onChanged: (bool value) {
                                if (value) {
                                  context
                                      .read<AuthenticationCubit>()
                                      .state
                                      .localAuthenticationService
                                      .authenticate()
                                      .then((isAuthenticated) {
                                    if (isAuthenticated) {
                                      HiveStorage().putData(GlobalConstants.isBiometricEnabled, true);
                                      context.read<ProfileCubit>().changeTouchId(true);
                                    }
                                  });
                                } else {
                                  HiveStorage().putData(GlobalConstants.isBiometricEnabled, false);
                                  context.read<ProfileCubit>().changeTouchId(false);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
