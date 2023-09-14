import 'package:flutter/material.dart';
import '/utils/app_color.dart';

class CustomAppBar extends StatelessWidget {
  final IconButton leadingIcon;
  final String title;
  final List<Widget> actions;

  const CustomAppBar({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      leading: leadingIcon,
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: AppColor.whiteColor),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
