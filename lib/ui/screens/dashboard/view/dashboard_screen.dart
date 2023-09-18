import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/authentication/view/login_screen.dart';
import 'package:hr_emp_proj/ui/screens/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_state.dart';
import 'package:hr_emp_proj/ui/widgets/loader_widget.dart';
import 'package:hr_emp_proj/utils/configuration.dart';
import '../../../../utils/hive_db/hive_db.dart';
import '../../../widgets/fl_charts/bar_graph.dart';
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
                        DashBoardScreenNew(),
                        LeaveRequestScreen(),
                        const Scaffold(),
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

class DashBoardScreenNew extends StatelessWidget {
  DashBoardScreenNew({super.key});
  final List listIcon = [
    Icons.calendar_today_rounded,
    Icons.layers_outlined,
    Icons.chat,
    Icons.warning_rounded,
    Icons.copy,
  ];
  final List listIconName = [
    "Attendance",
    "Leaves",
    "Requests",
    "Offenses",
    "Documents",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: BlocBuilder<DashboardCubit,DashboardState>(
        builder: (context, state){
          return SingleChildScrollView(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
              child: Column(
                children: [
                  SizedBox(
                    height: context.getScreenHeight * 0.28,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.getScreenWidth * 0.03),
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
                              const Text(
                                "Rimsha Rashid",
                                style: TextStyle(
                                    color: AppColor.primaryTextWhiteColor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "Director HR & Operations",
                                style: TextStyle(
                                    color: AppColor.primaryTextWhiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: context.getScreenHeight * 0.02,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.flag,
                                    color: AppColor.primaryTextWhiteColor,
                                  ),
                                  Text(
                                    "Director HR & Operations",
                                    style: TextStyle(
                                        color: AppColor.primaryTextWhiteColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: context.getScreenHeight * 0.14,
                          right: context.getScreenHeight * 0.03,
                          child: Container(
                            height: context.getScreenHeight * 0.12,
                            width: context.getScreenHeight * 0.12,
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
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dashboard",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.getScreenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      5,
                          (index) => IconCard(
                        iconData: listIcon[index],
                        iconName: listIconName[index],
                        iconSize: 25,
                      ),
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
                  SizedBox(height: context.getScreenHeight * 0.03),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Weekly Attendance",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Week 01 September",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.getScreenHeight * 0.03),
                  Container(
                    height: context.getScreenHeight * 0.28,
                    width: context.getScreenWidth * 0.95,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 2,
                            color: AppColor.secondaryTextColor,
                            blurRadius: 10,
                          ),
                        ],
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const MyBarGraph(
                      monthlySummary: <double>[
                        2,
                        5,
                        3,
                        1,
                        4,
                        5,
                        8,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColor.primaryTextBlackColor,
          ),
        ),
      ],
    );
  }
}

class IconCard extends StatelessWidget {
  final IconData iconData;
  final String iconName;
  final double iconSize;
  const IconCard({
    super.key,
    required this.iconData,
    required this.iconName, required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.getScreenHeight * 0.005),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                alignment: Alignment.center,
                height: context.getScreenHeight * 0.06,
                width: context.getScreenHeight * 0.06,
                color: AppColor.primaryColor,
                child: Icon(
                  iconData,
                  color: AppColor.whiteColor,
                  size: iconSize,
                )),
          ),
          const SizedBox(height: 2),
          Text(
            iconName,
            style: const TextStyle(
              color: AppColor.secondaryTextColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

