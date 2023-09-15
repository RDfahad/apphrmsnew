import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/authentication/view/login_screen.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_state.dart';
import 'package:hr_emp_proj/ui/widgets/loader_widget.dart';
import 'package:hr_emp_proj/utils/configuration.dart';
import '../../../../utils/hive_db/hive_db.dart';
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
          title: const Text(
            "Dashboard",
            style: TextStyle(fontSize: 16, color: AppColor.whiteColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                HiveStorage().putData("isLogIn", false);
                Config.isLoggedIn = false;
                Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => LoginScreen()));
              },
              icon: const Icon(
                Icons.logout,
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return CustomLoaderWidget(
              isLoading: state.isLoading,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: context.getScreenHeight * 0.26,
                      width: context.getScreenWidth,
                      child: HeadPart(
                          email: state.userData.user?.email ?? '',
                          name: state.userData.user?.name ?? ''),
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
                      margin: EdgeInsets.symmetric(
                          horizontal: context.getScreenWidth * 0.03),
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
              ),
            );
          },
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
