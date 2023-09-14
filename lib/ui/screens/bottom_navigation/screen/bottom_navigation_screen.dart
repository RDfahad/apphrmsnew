import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/ui/screens/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import '/ui/screens/dashboard/view/dashboard_screen.dart';
import '/ui/screens/dashboard/view/leave_request.dart';
import '/ui/screens/detail/screen/detail_screen.dart';
import '/utils/app_color.dart';

class BottomNavigationScreen extends StatelessWidget {
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
      case BottomNavigationTabState.homeScreen:
        return DashBoardScreen();
      case BottomNavigationTabState.leaveRequest:
        return LeaveRequestScreen();
      case BottomNavigationTabState.leaveRequestScreen:
        return DetailScreen();
      case BottomNavigationTabState.profile:
        return Container();
      default:
        return Container();
    }
  }
}
