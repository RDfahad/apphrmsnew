import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';
import '../../../../utils/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
          child: Column(
            children: [
                SizedBox(
                  width: context.getScreenWidth,
                  child: Stack(
                    // fit: StackFit.loose,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.getScreenWidth * 0.05,vertical: context.getScreenHeight * 0.05),
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
                          style: TextStyle(
                              color: AppColor.primaryTextWhiteColor,
                              fontSize: 28,
                          height: 1),
                        ),
                      ),
                      Positioned(
                        top: context.getScreenHeight * 0.1,
                        right: context.getScreenHeight * 0.05,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
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
                              ),
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
                                child: const Center(
                                  child: Icon(Icons.edit,color: AppColor.whiteColor,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(left: context.getScreenWidth * 0.04,top: context.getScreenHeight * 0.02),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rimsha Rashid",
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Director HR & Operations",
                      style: TextStyle(
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
                      title: const Text('Change Password',style: TextStyle(color: AppColor.blackColor),),
                      trailing: Icon(Icons.arrow_forward_outlined, color: Colors.grey.shade500,),
                      leading: const Icon(Icons.lock_open, color: AppColor.primaryColor,),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),
                      child: const Divider(
                        height: 1,
                        thickness: 0.3,
                        color: AppColor.secondaryTextColor,
                      ),
                    ),
                    ListTile(
                      title: const Text('Logout',style: TextStyle(color: AppColor.blackColor),),
                      trailing: Icon(Icons.arrow_forward_outlined, color: Colors.grey.shade500,),
                      leading: Transform.flip(
                          flipX: true,
                          child: const Icon(Icons.logout, color: AppColor.primaryColor,)),
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
                      title: const Text('Request Notifications',style: TextStyle(color: AppColor.blackColor),),
                      trailing: Switch(
                        activeColor: AppColor.whiteColor,
                        focusColor: AppColor.blackColor,
                        activeTrackColor: AppColor.primaryColor,
                        inactiveThumbColor: AppColor.whiteColor,
                        inactiveTrackColor: Colors.grey.shade400,
                        value: false,
                        trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        onChanged: (bool value) {  },
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),
                      child: const Divider(
                        height: 1,
                        thickness: 0.3,
                        color: AppColor.secondaryTextColor,
                      ),
                    ),
                    ListTile(
                      title: const Text('Announcement Notifications',style: TextStyle(color: AppColor.blackColor),),
                      trailing: Switch(
                        activeColor: AppColor.whiteColor,
                        focusColor: AppColor.blackColor,
                        activeTrackColor: AppColor.primaryColor,
                        inactiveThumbColor: AppColor.whiteColor,
                        inactiveTrackColor: Colors.grey.shade400,
                        value: true,
                        trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        onChanged: (bool value) {  },
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),
                      child: const Divider(
                        height: 1,
                        thickness: 0.3,
                        color: AppColor.secondaryTextColor,
                      ),
                    ),
                    ListTile(
                      title: const Text('Touch ID',style: TextStyle(color: AppColor.blackColor),),
                      trailing: Switch(
                        activeColor: AppColor.whiteColor,
                        focusColor: AppColor.blackColor,
                        activeTrackColor: AppColor.primaryColor,
                        inactiveThumbColor: AppColor.whiteColor,
                        inactiveTrackColor: Colors.grey.shade400,
                        value: true,
                        trackOutlineColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        onChanged: (bool value) {  },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
