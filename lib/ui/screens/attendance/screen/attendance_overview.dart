import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/attendance/cubit/attendance_cubit.dart';
import 'package:hr_emp_proj/ui/screens/attendance/cubit/attendance_state.dart';
import 'package:hr_emp_proj/ui/widgets/fl_charts/fl_line_chart/fl_line_chart.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/helper.dart';
import '../../../widgets/attendance_list_card.dart';
import '../../../widgets/time_data.dart';

// //////////////////////////////////
class AttendanceOverViewScreen extends StatelessWidget {
  AttendanceOverViewScreen({super.key}) {
    // setupScrollController();
  }
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    void setupScrollController(BuildContext context) {
      scrollController.addListener(() {
        log('askjdasjkdbhabs');
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          BlocProvider.of<PaginationCubit>(context).loadMore();
        }
      });
    }

    setupScrollController(context);
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: BlocBuilder<PaginationCubit, PaginationState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * 0.02),
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
                SizedBox(height: context.getScreenHeight * 0.03),
                Container(
                  height: context.getScreenHeight * 0.36,
                  width: context.getScreenWidth * 1,
                  padding: EdgeInsets.symmetric(
                          horizontal: context.getScreenWidth * 0.02,
                          vertical: context.getScreenHeight * 0.02)
                      .copyWith(bottom: context.getScreenHeight * 0.02),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 5,
                        color: AppColor.whiteColor,
                        blurRadius: 10,
                      ),
                    ],
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monthly Overview",
                            style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.more_horiz_outlined,
                            size: 35,
                          )
                        ],
                      ),
                      SizedBox(height: context.getScreenHeight * 0.02),
                      SizedBox(
                        height: context.getScreenHeight * 0.26,
                        child: const FlLineChartScreen(),
                      ),
                    ],
                  ),
                ),
                Container(
                  //  height: context.getScreenHeight * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 1,
                        color: AppColor.whiteColor,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.secondaryTextColor,
                        ),
                      ),
                      Text(
                        "Time In",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.secondaryTextColor,
                        ),
                      ),
                      Text(
                        "Time Out",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.secondaryTextColor,
                        ),
                      ),
                      Text(
                        "Working Hrs",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.getScreenHeight * 0.04),
                Container(
                  color: AppColor.whiteColor,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.attendanceRecords.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      log("state.attendanceRecords.data?.length ${state.attendanceRecords.data?.length}");
                      return Container(
                        padding: EdgeInsets.all(12),
                        child: AttendenceListCard(
                          workingHr: Helper.calculateWorkingHours(
                              date: state.attendanceRecords.data?[index].date,
                              startTime: state
                                  .attendanceRecords.data?[index].checkInTime,
                              endTime: state
                                  .attendanceRecords.data?[index].checkOutTime),
                          timeOut: state.attendanceRecords.data?[index]
                                  .checkOutTime ??
                              '',
                          timeIn: state
                                  .attendanceRecords.data?[index].checkInTime ??
                              '',
                          date: state.attendanceRecords.data?[index].date ?? '',
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: context.getScreenHeight * 0.04),

           
              ],
            ),
          );
        },
      ),
    );
  }
}
