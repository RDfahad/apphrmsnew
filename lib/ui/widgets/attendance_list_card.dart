import 'package:flutter/material.dart';
import '../../utils/app_color.dart';

class AttendenceListCard extends StatelessWidget {
  final String date;
  final String timeIn;
  final String timeOut;
  final String workingHr;

  const AttendenceListCard({
    super.key,
    required this.date,
    required this.timeIn,
    required this.timeOut,
    required this.workingHr,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.start,
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
          timeOut,
          style: TextStyle(
              color: timeOut == "absent"
                  ? AppColor.redColor
                  : AppColor.primaryTextBlackColor),
        ),
        Text(
          workingHr,
          style: const TextStyle(
            color: AppColor.primaryTextBlackColor,
          ),
        ),
      ],
    );
  }
}