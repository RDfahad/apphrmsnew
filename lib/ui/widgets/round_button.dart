import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.borderRadius = 10,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final double borderRadius;
  final VoidCallback onPress;

  final Color? textColor, buttonColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 10),
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          // fontWeight: FontWeight.bold,
                          color: textColor != null
                              ? textColor
                              : AppColor.whiteColor)))),
    );
  }
}
