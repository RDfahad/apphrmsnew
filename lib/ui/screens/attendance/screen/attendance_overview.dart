import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/attendance/screen/view_all_screen.dart';
import '/ui/screens/attendance/cubit/attendance_cubit.dart';
import '/ui/screens/attendance/cubit/attendance_state.dart';
import '/ui/widgets/fl_charts/fl_line_chart/fl_line_chart.dart';
import '/utils/extension_methods.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/helper.dart';
import '../../../widgets/attendance_list_card.dart';
import '../../../widgets/time_data.dart';

class AttendanceOverViewScreen extends StatelessWidget {
  const AttendanceOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: BlocBuilder(
        bloc: BlocProvider.of<AttendanceCubit>(context)..getAttendance(),
        builder: (context, AttendanceState state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.getScreenWidth * 0.03,
            ),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: AppColor.appBackgroundColor,
                  expandedHeight: context.getScreenHeight * 0.15,
                  pinned: true,
                  flexibleSpace: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
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
                      ),
                    ),
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
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: context.getScreenHeight * 0.02),
                    Container(
                      height: context.getScreenHeight * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 5,
                            color: AppColor.whiteColor,
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
                                    color: AppColor.blackColor, fontSize: 16, fontWeight: FontWeight.w500),
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
                    SizedBox(height: context.getScreenHeight * 0.02),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: state.attendanceRecords.data!.isEmpty
                            ? null
                            : () {
                                nextScreen(context, const AttendanceRecordsScreen());
                              },
                        child: const Text(
                          "See All   ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.getScreenHeight * 0.02),
                    Container(
                      height: context.getScreenHeight * 0.08,
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
                    SizedBox(height: context.getScreenHeight * 0.02),
                  ]),
                ),
                SliverToBoxAdapter(
                  child: state.attendanceRecords.data?.isNotEmpty ?? false
                      ? Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor, borderRadius: BorderRadius.circular(12)),
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 0.5,
                                  ),
                                );
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.attendanceRecords.data!.length > 6
                                  ? 6
                                  : state.attendanceRecords.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: AttendenceListCard(
                                    workingHr: Helper.calculateWorkingHours(
                                        date: state.attendanceRecords.data?[index].date,
                                        startTime: state.attendanceRecords.data?[index].checkInTime,
                                        endTime: state.attendanceRecords.data?[index].checkOutTime),
                                    timeOut: state.attendanceRecords.data?[index].checkOutTime ?? '',
                                    timeIn: state.attendanceRecords.data?[index].checkInTime ?? '',
                                    date: state.attendanceRecords.data?[index].date ?? '',
                                  ),
                                );
                              }),
                        )
                      : const Center(child: Text('No Attendance Found')),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
