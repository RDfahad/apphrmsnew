import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_state.dart';
import 'package:hr_emp_proj/ui/widgets/fl_charts/fl_line_chart/fl_line_chart.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

import '../../../../utils/app_color.dart';
import '../../../widgets/time_data.dart';
import '../../dashboard/view/leave_request.dart';

class AttendanceOverViewScreen extends StatelessWidget {
  const AttendanceOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.getScreenHeight * 0.02,
            ),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: AppColor.appBackgroundColor,
                  expandedHeight: context.getScreenHeight * 0.15,
                  pinned: true,
                  flexibleSpace: Container(
                    alignment: Alignment.bottomLeft,
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
                    SizedBox(height: context.getScreenHeight * 0.03),
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
                    SizedBox(height: context.getScreenHeight * 0.04),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // return AttendenceOverview(
                      //   date: '2023-09-20',
                      //   timeIn: '2023-09-20',
                      //   timeOut: 'Absent',
                      //   workingHr: "9",
                      // );

                      return AttendenceOverview1(
                        attendanceObject: state
                            .attendanceRecords.responseData!.attendenceObject!,
                        index: index,
                      );
                    },
                    childCount: //10
                        state.attendanceRecords.responseData!.attendenceObject!
                            .data!.length,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// class AttendanceOverViewScreen extends StatelessWidget {
//   const AttendanceOverViewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.appBackgroundColor,
//       body: Column(
//         children: [
//           Container(
//             padding:
//                 EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.centerRight,
//                   colors: [
//                     Color(0xFF0b84c8),
//                     Color(0xff214cbd),
//                     Color(0xff214cbd),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                 )),
//             height: context.getScreenHeight * 0.2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: List.generate(
//                     3,
//                     (index) => Container(
//                       margin: const EdgeInsets.only(left: 2),
//                       height: 7,
//                       width: 7,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: AppColor.whiteColor),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Text(
//                   "Attendance",
//                   style: TextStyle(
//                       color: AppColor.primaryTextWhiteColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w300),
//                 ),
//                 const Text(
//                   "Overview",
//                   style: TextStyle(
//                       color: AppColor.primaryTextWhiteColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: context.getScreenHeight * 0.02),
//           Container(
//             height: context.getScreenHeight * 0.1,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: AppColor.whiteColor,
//               boxShadow: const [
//                 BoxShadow(
//                   spreadRadius: 1,
//                   color: AppColor.secondaryTextColor,
//                   blurRadius: 5,
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 timeData("Time In", "05:21:09 am"),
//                 Container(width: 1, color: Colors.grey),
//                 timeData("Time Out", "20:34:21 pm"),
//                 Container(width: 1, color: Colors.grey),
//                 timeData("Working Hrs", "20:34:21 pm"),
//               ],
//             ),
//           ),
//           SizedBox(height: context.getScreenHeight * 0.03),
//           Container(
//             height: context.getScreenHeight * 0.36,
//             width: context.getScreenWidth * 1,
//             padding: EdgeInsets.symmetric(
//                     horizontal: context.getScreenWidth * 0.02,
//                     vertical: context.getScreenHeight * 0.02)
//                 .copyWith(bottom: context.getScreenHeight * 0.02),
//             decoration: BoxDecoration(
//               boxShadow: const [
//                 BoxShadow(
//                   spreadRadius: 5,
//                   color: AppColor.whiteColor,
//                   blurRadius: 10,
//                 ),
//               ],
//               color: AppColor.whiteColor,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Monthly Overview",
//                       style: TextStyle(
//                           color: AppColor.blackColor,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Icon(
//                       Icons.more_horiz_outlined,
//                       size: 35,
//                     )
//                   ],
//                 ),
//                 SizedBox(height: context.getScreenHeight * 0.02),
//                 SizedBox(
//                   height: context.getScreenHeight * 0.26,
//                   child: const FlLineChartScreen(),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: context.getScreenHeight * 0.08,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: AppColor.whiteColor,
//               boxShadow: const [
//                 BoxShadow(
//                   spreadRadius: 1,
//                   color: AppColor.whiteColor,
//                   blurRadius: 5,
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.all(16.0),
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Date",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                     color: AppColor.secondaryTextColor,
//                   ),
//                 ),
//                 Text(
//                   "Time In",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                     color: AppColor.secondaryTextColor,
//                   ),
//                 ),
//                 Text(
//                   "Time Out",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                     color: AppColor.secondaryTextColor,
//                   ),
//                 ),
//                 Text(
//                   "Working Hrs",
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                     color: AppColor.secondaryTextColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: context.getScreenHeight * 0.04),
//           ElevatedButton(
//               onPressed: () {
//                 // void totalTiming(DateTime start, DateTime end) {
//                 //   start.difference(end);

//                 //   log("totalTiming ${start.difference(end)}");
//                 // }

//                 // DateTime rideDate = DateTime.parse("2023-09-01 18:45:59");
//                 // print(DateTime.parse("2023-09-01 19:06:38")
//                 //     .difference(DateTime.parse("2023-09-01 10:04:38"))
//                 //     .inHours);
//                 // print(DateTime.parse("2023-09-01 19:06:38")
//                 //     .difference(DateTime.parse("2023-09-01 10:04:38"))
//                 //     .inMinutes);
//                 // print(DateTime.parse("2023-09-01 19:06:38")
//                 //     .difference(DateTime.parse("2023-09-01 10:04:38")));

//                 // Duration difference = DateTime.parse("2023-09-01 19:06:38")
//                 //     .difference(DateTime.parse("2023-09-01 10:04:38"));
//                 // log("totalTiming ${difference.inHours}:" +
//                 //     (difference.inMinutes % 60).toString().padLeft(2, '0'));
//                 // log("totalTiming ${difference}");

//                 String startDateString = "2023-09-20 18:45:59";
//                 String endDateString = "2023-09-20 19:00:00";

//                 Duration difference = endDateString.difference(startDateString);

//                 log("difference  ${difference}"); // This will print the duration between the two dates.
//               },
//               child: Text("TIMINGCHECK"))
//           // ListView.builder(
//           //   shrinkWrap: true,
//           //   itemBuilder: (context, index) {
//           //     return AttendenceOverview(
//           //       date: '2023-09-20',
//           //       timeIn: '2023-09-20',
//           //       timeOut: 'Absent',
//           //       workingHr: "9",
//           //     );
//           //   },
//           // )
//         ],
//       ),
//     );
//   }
// }
