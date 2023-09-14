import 'package:flutter/material.dart';
import '/utils/app_color.dart';

class AttendanceReportCard extends StatelessWidget {
  const AttendanceReportCard({
    super.key,
    this.listColor,
    required this.listCards,
  });

  final List? listColor;
  final Map<String, String> listCards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        // childAspectRatio: 1.15,
      ),
      itemCount: listCards.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // height: context.getScreenHeight * 0.12,
          // width: context.getScreenWidth * 0.3,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                color: Colors.grey.shade300,
                blurRadius: 40,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: listColor != null ? listColor![index] : AppColor.whiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                listCards.keys.elementAt(index),
                style:
                    const TextStyle(fontSize: 14, color: AppColor.blackColor),
              ),
              Text(
                listCards.values.elementAt(index),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.blackColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
