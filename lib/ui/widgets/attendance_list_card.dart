import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: context.getScreenWidth * 0.17,
            child: Text(
              date,
              style: const TextStyle(
                color: AppColor.primaryTextBlackColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: context.getScreenWidth * 0.12,
            child: Text(
              timeIn,
              style: const TextStyle(
                color: AppColor.primaryTextBlackColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: context.getScreenWidth * 0.14,
            child: Text(
              timeOut,
              style: TextStyle(
                color: timeOut == "absent"
                    ? AppColor.redColor
                    : AppColor.primaryTextBlackColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: context.getScreenWidth * 0.15,
            child: Text(
              workingHr,
              style: const TextStyle(
                color: AppColor.primaryTextBlackColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
