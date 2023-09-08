import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/view/dashboard_screen.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/view/leave_request.dart';
import 'package:hr_emp_proj/ui/screens/detail/screen/detail_screen.dart';
import 'package:hr_emp_proj/utils/app_color.dart';

class BottomNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationTabState>(
      builder: (context, selectedTab) {
        return Scaffold(
          body: _getBodyForTab(selectedTab),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: AppColor.secondaryTextColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedTab.index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Tab 1',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.calendar),
                label: 'Tab 2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_rounded),
                label: 'Tab 3',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp),
                label: 'Tab 4',
              ),
            ],
            onTap: (index) {
              final selectedTab = BottomNavigationTabState.values[index];
              context.read<BottomNavigationCubit>().changeTab(selectedTab);
            },
          ),
        );
      },
    );
  }

  Widget _getBodyForTab(BottomNavigationTabState tab) {
    switch (tab) {
      case BottomNavigationTabState.Tab1:
        return LeaveRequestScreen();
      case BottomNavigationTabState.Tab2:
        return DashBoardScreen();
      case BottomNavigationTabState.Tab3:
        return DetailScreen();
      case BottomNavigationTabState.Tab4:
        return Tab3Screen();
      default:
        return Container();
    }
  }
}
