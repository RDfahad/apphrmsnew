import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

import '../../../../utils/app_color.dart';
import '../../dashboard/view/dashboard_screen.dart';

class AttendanceOverViewScreen extends StatelessWidget {
  const AttendanceOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: Column(
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.only(left: 2),
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.whiteColor),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Attendance",
                  style: TextStyle(
                      color: AppColor.primaryTextWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                const Text(
                  "Overview",
                  style: TextStyle(
                      color: AppColor.primaryTextWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(height: context.getScreenHeight * 0.02),
          Container(
            height: context.getScreenHeight * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.whiteColor,
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 1,
                  color: AppColor.secondaryTextColor,
                  blurRadius: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                timeData("Time In", "05:21:09 am"),
                Container(width: 1, color: Colors.grey),
                timeData("Time Out", "20:34:21 pm"),
                Container(width: 1, color: Colors.grey),
                timeData("Working Hrs", "20:34:21 pm"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
