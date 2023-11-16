import 'package:flutter/material.dart';
import '../../utils/app_color.dart';
import '/utils/extension_methods.dart';

class IconCard extends StatelessWidget {
  final IconData iconData;
  final String iconName;
  final double iconSize;
  const IconCard({
    super.key,
    required this.iconData,
    required this.iconName,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.getScreenHeight * 0.005),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                alignment: Alignment.center,
                height: context.getScreenHeight * 0.06,
                width: context.getScreenHeight * 0.06,
                color: AppColor.primaryColor,
                child: Icon(
                  iconData,
                  color: AppColor.whiteColor,
                  size: iconSize,
                )),
          ),
          const SizedBox(height: 2),
          Text(
            iconName,
            style: TextStyle(
              color: AppColor.blackColor.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
