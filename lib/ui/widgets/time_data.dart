import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

Column timeData(String title, String time) {
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 10.0,
          color: AppColor.secondaryTextColor,
        ),
      ),
      Text(
        time,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryTextBlackColor,
        ),
      ),
    ],
  );
}
