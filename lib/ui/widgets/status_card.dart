import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    this.listColor,
    required this.listCards,
  });

  final List? listColor;
  final Map<String, String> listCards;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        3,
        (index) => Container(
          height: context.getScreenHeight * 0.12,
          width: context.getScreenWidth * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: listColor != null ? listColor![index] : AppColor.whiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                listCards.keys.elementAt(index),
                style:
                    const TextStyle(fontSize: 14, color: AppColor.whiteColor),
              ),
              Text(
                listCards.values.elementAt(index),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
