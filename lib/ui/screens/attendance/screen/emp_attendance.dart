import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

import '../../dashboard/bloc/dashboard_state.dart';
import '../component/attendance_card.dart';

class AttendanceScreen extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Attendance'),
    const Tab(text: 'Request'),
  ];

  AttendanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: AppBar(
          title: const Text(
            "Employee Attendance List",
            style: TextStyle(color: AppColor.whiteColor),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColor.whiteColor,
            onPressed: () {
              context
                  .read<DashboardCubit>()
                  .changeTab(BottomNavigationTabState.homeScreen);
            },
          ),
          backgroundColor: AppColor.primaryColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(context.getScreenHeight * 0.1),
            child: Column(
              children: [
                Container(
                  height: context.getScreenHeight * 0.05,
                  margin: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * 0.02),
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * 0.02,
                      vertical: context.getScreenHeight * 0.004),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: AppColor.primaryButtonColor,
                  ),
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    tabs: myTabs,
                    dividerColor: Colors.transparent,
                    indicatorWeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.whiteColor),
                    labelColor: Colors.black,
                    unselectedLabelColor: AppColor.whiteColor,
                  ),
                ),
                SizedBox(
                  height: context.getScreenHeight * 0.01,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  const TabOneScreen(),
                  Container(
                    child: Text("TAB2"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabOneScreen extends StatelessWidget {
  const TabOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, ind) {
        return AttendanceCard(
          name: "Lance Bogrol",
          role: "Mobile Designer",
          date: "19 Apr, 2021",
          inTime: "05:21",
          outTime: "20:34",
          status: "Pending",
          duration: "1h 20m 30s",
          totalDuration: "of 12 Hours",
          endValue: 0.6,
        );
        //AttendanceCard(context);
      },
    );
  }
}
