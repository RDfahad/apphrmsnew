import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class CustomSteeperCard extends StatelessWidget {
  final String status;
  final String title;

  const CustomSteeperCard({Key? key, required this.status, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = status == "Approved" ? Colors.green.shade100 : Colors.blue.shade100;
    Color statusColor = status == "Approved" ? Colors.green.shade900 : Colors.blue.shade900;

    return IntrinsicHeight(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: statusColor,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: VerticalDivider(
                    color: statusColor,
                    thickness: 2.5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02, vertical: 7),
            height: context.getScreenHeight * 0.11,
            width: context.getScreenWidth * 0.7,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    Text(
                      status,
                      style: TextStyle(color: statusColor),
                    )
                  ],
                ),
                Text(
                  "Comments:",
                  style: TextStyle(fontSize: context.getFontText.labelSmall!.fontSize),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
