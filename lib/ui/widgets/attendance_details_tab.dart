import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class AttendanceDetailsTab extends StatelessWidget {
  const AttendanceDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getScreenHeight * 0.064,
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(
          0xFFF5F5F5,
        ),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            color: AppColor.whiteColor,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: context.getScreenHeight * 0.045,
            width: context.getScreenWidth * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'All',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1569FF),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: context.getScreenHeight * 0.045,
            width: context.getScreenWidth * 0.25,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Absents',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF77838F),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: context.getScreenHeight * 0.045,
            width: context.getScreenWidth * 0.25,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Lates',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF77838F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
