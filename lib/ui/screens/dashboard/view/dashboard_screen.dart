import 'package:flutter/material.dart';
import '/ui/screens/dashboard/component/head_part.dart';
import '/ui/screens/dashboard/component/middle_part.dart';
import '/ui/screens/dashboard/view/leave_request.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});
  final Map<String, String> properties = {
    'Leave Request': 'leave_request.png',
    'Attendance': 'attendance.png',
    'Salary': 'salary.png',
    'Training': 'training.png',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: const Icon(
            Icons.arrow_back,
            color: AppColor.whiteColor,
          ),
          title: const Text(
            "Dashboard",
            style: TextStyle(fontSize: 16, color: AppColor.whiteColor),
          ),
          centerTitle: true,
          actions: [
            const Icon(
              Icons.more_vert,
              color: AppColor.whiteColor,
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: context.getScreenHeight * 0.26,
                width: context.getScreenWidth,
                child: const HeadPart(),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(height: context.getScreenHeight * 0.02)),
            SliverToBoxAdapter(
              child: GridViewScreenPart(
                properties: properties,
                pageName: [
                  LeaveRequestScreen(),
                  DashBoardScreen(),
                  LeaveRequestScreen(),
                  DashBoardScreen(),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(height: context.getScreenHeight * 0.02)),
            SliverToBoxAdapter(
              child: Container(
                margin:  EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.03),
                height: context.getScreenHeight * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.whiteColor,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    timeData("In Time", "05:21:09 am"),
                    Container(width: 1, color: Colors.grey),
                    timeData("Break Time", "9 hr"),
                    Container(width: 1, color: Colors.grey),
                    timeData("Out Time", "20:34:21 pm"),
                  ],
                ),
              ),
            ),

          ],
        ));
  }

  Column timeData(String title, String time) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13.0,
            color: AppColor.secondaryTextColor,
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 14.2,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryTextBlackColor,
          ),
        ),
      ],
    );
  }
}
