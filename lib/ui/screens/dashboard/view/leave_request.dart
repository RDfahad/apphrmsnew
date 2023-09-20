import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hr_emp_proj/domain/entities/attendance/attendance_records.dart';
import '../../../widgets/status_card.dart';
import '/ui/widgets/custom_app_bar.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class LeaveRequestScreen extends StatelessWidget {
  LeaveRequestScreen({super.key});

  final Map<String, String> listCards = {
    'Annual Leave': '4/9',
    'Medical Leaves': '3/8',
    'Casual Leaves': '2/6',
  };

  final List listColor = [
    AppColor.primaryColor,
    AppColor.secondaryColor,
    AppColor.primaryTextBlackColor
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Center(
            heightFactor: 10,
            child: Icon(
              Icons.add,
              color: AppColor.whiteColor,
            )),
      ),
      backgroundColor: AppColor.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CustomAppBar(
          leadingIcon: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColor.whiteColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: "Leave Request",
          actions: const [
            Icon(
              Icons.more_vert,
              color: AppColor.whiteColor,
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: context.getScreenHeight * 0.02),
            StatusCard(listColor: listColor, listCards: listCards),
            SizedBox(height: context.getScreenHeight * 0.03),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Leave Request Info',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: AppColor.blackColor,
                    ),
                  ),
                  Text(
                    'This Year',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.getScreenHeight * 0.03),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: AppColor.whiteColor,
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      ' From',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'To',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: AppColor.whiteColor,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return AttendenceOverview(
                      date: '2023-09-15',
                      timeIn: '2023-09-20',
                      timeOut: 'Approved',
                      workingHr: "  ",
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),

      //        ),
      //   ],
      // ),
    );
  }
}

class AttendenceOverview extends StatelessWidget {
  final String date;
  final String timeIn;
  final String timeOut;
  final String workingHr;

  AttendenceOverview({
    super.key,
    required this.date,
    required this.timeIn,
    required this.timeOut,
    required this.workingHr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getScreenHeight * 0.04,
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       spreadRadius: 5,
      //       color: Colors.grey.shade300,
      //       blurRadius: 2,
      //     ),
      //   ],
      color: AppColor.whiteColor,
      //   borderRadius: BorderRadius.circular(16),
      // ),
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: AppColor.primaryTextBlackColor,
            ),
          ),
          Text(
            timeIn,
            style: const TextStyle(
              color: AppColor.primaryTextBlackColor,
            ),
          ),
          Text(
            '$timeOut',
            style: TextStyle(
                color: timeOut == "absent"
                    ? AppColor.redColor
                    : AppColor.primaryTextBlackColor),
          ),
          Text(
            '$workingHr',
            style: const TextStyle(
              color: AppColor.primaryTextBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}

class AttendenceOverview1 extends StatelessWidget {
  final AttendenceObject attendanceObject;

  final int index;

  const AttendenceOverview1({
    super.key,
    required this.attendanceObject,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getScreenHeight * 0.04,
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       spreadRadius: 5,
      //       color: Colors.grey.shade300,
      //       blurRadius: 2,
      //     ),
      //   ],
      color: AppColor.whiteColor,
      //   borderRadius: BorderRadius.circular(16),
      // ),
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            attendanceObject.data![index].date.toString(),
            style: const TextStyle(
              color: AppColor.primaryTextBlackColor,
            ),
          ),
          Text(
            attendanceObject.data![index].checkInTime.toString(),
            style: const TextStyle(
              color: AppColor.primaryTextBlackColor,
            ),
          ),
          Text(
            '${attendanceObject.data?[index].checkOutTime ?? ""}',
            style: TextStyle(
                color: attendanceObject.data?[index].checkOutTime == "absent"
                    ? AppColor.redColor
                    : AppColor.primaryTextBlackColor),
          ),
          Text(
            '9',
            style: const TextStyle(
              color: AppColor.primaryTextBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
