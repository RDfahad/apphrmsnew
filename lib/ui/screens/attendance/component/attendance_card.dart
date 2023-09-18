import 'package:flutter/material.dart';
import '/utils/extension_methods.dart';

import '../../../../utils/app_color.dart';

class AttendanceCard extends StatelessWidget {
  final String name;
  final String role;
  final String date;
  final String inTime;
  final String outTime;
  final String status;
  final String duration;
  final String totalDuration;
  final double endValue;

   AttendanceCard({
    required this.name,
    required this.role,
    required this.date,
    required this.inTime,
    required this.outTime,
    required this.status,
    required this.duration,
    required this.totalDuration, required this.endValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getScreenHeight * 0.28,
      margin: EdgeInsets.only(
        top: context.getScreenWidth * 0.03,
        left: context.getScreenWidth * 0.03,
        right: context.getScreenWidth * 0.03,
      ),
      padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.04),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            color: Colors.grey.shade300,
            blurRadius: 2,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.primaryButtonColor,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: AppColor.primaryColor,
              ),
            ),
            title: Text(
              name,
              style: const TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              role,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              timeWidget("Date", date),
              const Spacer(),
              timeWidget("In Time", inTime),
              const Spacer(),
              timeWidget("Out Time", outTime),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  status,
                  style: TextStyle(fontSize: 16, color: Colors.yellow.shade900),
                ),
              ),
              Center(
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: endValue),
                  duration: const Duration(seconds: 1),
                  builder: (context, value, child) {
                    return CircularProgressIndicator(
                      strokeCap: StrokeCap.round,
                      value: value,
                      strokeAlign: 8,
                      strokeWidth: 6,
                      backgroundColor: AppColor.secondaryTextColor,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColor.primaryButtonColor),
                    );
                  },
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      duration,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      totalDuration,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Column timeWidget(String title, String time) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryTextBlackColor,
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 13.0,
            color: AppColor.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
