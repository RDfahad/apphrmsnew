import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_state.dart';
import 'package:hr_emp_proj/ui/widgets/loader_widget.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';
import '../../attendance/screen/attendance_overview.dart';
import '../../dashboard/view/leave_request.dart';
import '../../document_overview.dart/document_overview.dart';
import '../../profile/view/profile_screen.dart';
import '/ui/screens/dashboard/view/dashboard_screen.dart';
import '/utils/app_color.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<DashboardCubit>(context)..refreshToken(),
      listener: (context, DashboardState state) {},
      builder: (context, DashboardState state) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: CustomLoaderWidget(
            isLoading: state.isLoading,
            child: Scaffold(
              body: _getBodyForTab(state.bottomNavigationTabState),
              bottomNavigationBar: BottomNavigationBar(
                useLegacyColorScheme: false,

                backgroundColor: Colors.black, // AppColor.secondaryButtonColor,
                selectedItemColor: AppColor.whiteColor,
                unselectedItemColor: AppColor.whiteColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: state.bottomNavigationTabState.index,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      width: context.getScreenWidth * 0.1,
                      height: context.getScreenHeight * 0.05,
                      decoration: BoxDecoration(
                          color: state.bottomNavigationTabState.index == 0
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                          child: Icon(
                        CupertinoIcons.square_grid_2x2,
                      )),
                    ),
                    label: 'Tab 1',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: context.getScreenWidth * 0.1,
                      height: context.getScreenHeight * 0.05,
                      decoration: BoxDecoration(
                          color: state.bottomNavigationTabState.index == 1
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                          child: Icon(
                        Icons.calendar_today_rounded,
                      )),
                    ),
                    label: 'Tab 2',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: context.getScreenWidth * 0.1,
                      height: context.getScreenHeight * 0.05,
                      decoration: BoxDecoration(
                          color: state.bottomNavigationTabState.index == 2
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(child: Icon(Icons.layers_outlined)),
                    ),
                    label: 'Tab 3',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: context.getScreenWidth * 0.1,
                      height: context.getScreenHeight * 0.05,
                      decoration: BoxDecoration(
                          color: state.bottomNavigationTabState.index == 3
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Icon(Icons.person_pin_rounded),
                      ),
                    ),
                    label: 'Tab 4',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Container(
                  //     width: context.getScreenWidth * 0.1,
                  //     height: context.getScreenHeight * 0.05,
                  //     decoration: BoxDecoration(
                  //         color: selectedTab.bottomNavigationTabState.index == 4
                  //             ? AppColor.primaryColor
                  //             : Colors.transparent,
                  //         borderRadius: BorderRadius.circular(8)),
                  //     child: const Center(
                  //       child: Icon(Icons.settings),
                  //     ),
                  //   ),
                  //   label: 'Tab 5',
                  // ),
                ],
                onTap: (index) {
                  final selectedTab = BottomNavigationTabState.values[index];
                  context.read<DashboardCubit>().changeTab(selectedTab);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getBodyForTab(BottomNavigationTabState tab) {
    switch (tab) {
      case BottomNavigationTabState.homeScreen:
        return DashBoardScreenNew();
      case BottomNavigationTabState.attendance:
        return const AttendanceOverViewScreen();
      case BottomNavigationTabState.detailReports:
        return DocumentOverViewScreen();
      case BottomNavigationTabState.profile:
        return const ProfileScreen();
      default:
        return Container(
          color: Colors.black,
        );
    }
  }
}
