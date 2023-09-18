import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/attendance/screen/emp_attendance.dart';
import '/ui/screens/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import '/ui/screens/dashboard/view/dashboard_screen.dart';
import '/ui/screens/detail/screen/detail_screen.dart';
import '/utils/app_color.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationTabState>(
      builder: (context, selectedTab) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Scaffold(
            // appBar: AppBar(),
            body: _getBodyForTab(selectedTab),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black, // AppColor.secondaryButtonColor,
              selectedItemColor: AppColor.primaryButtonColor,
              unselectedItemColor: AppColor.whiteColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: selectedTab.index,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_grid_2x2),
                  label: 'Tab 1',
                ),
                BottomNavigationBarItem(
                  icon: Badge(
                      label: Text(
                        "1",
                        style: TextStyle(color: AppColor.primaryTextWhiteColor),
                      ),
                      backgroundColor: AppColor.redColor,
                      child: Icon(CupertinoIcons.chat_bubble_text)),
                  label: 'Tab 2',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_rounded),
                  label: 'Tab 3',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_rounded),
                  label: 'Tab 4',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Tab 5',
                ),
              ],
              onTap: (index) {
                final selectedTab = BottomNavigationTabState.values[index];
                context.read<BottomNavigationCubit>().changeTab(selectedTab);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getBodyForTab(BottomNavigationTabState tab) {
    switch (tab) {
      case BottomNavigationTabState.homeScreen:
        return DashBoardScreen();
      case BottomNavigationTabState.attendance:
        return AttendanceScreen();
      case BottomNavigationTabState.detailreports:
        return DetailScreen();
      case BottomNavigationTabState.profile:
        return Container(
          color: Colors.black,
        );
      default:
        return Container();
    }
  }
}
